<?php
/*
Name: saveFormCustom.php
Description: This hook will be able to use a pretty email
*/


$formValues = $hook->getValues();

foreach ($formValues as $key => $value) {
    $newKey = ucfirst(str_replace("-", " ", $key));
    if ($newKey !== $key) {
        $formValues[$newKey] = $formValues[$key];
        unset($formValues[$key]);
    }
}

$fields = $formValues;
$formName = (is_null($hook->formit->config['formName'])) ? 'form-'.$modx->resource->get('id') : $hook->formit->config['formName'];

/* Start email */
$tplLayout = $modx->getOption('emailLayoutTpl', $formit->config, '');
$tplRows = $modx->getOption('emailRowsTpl', $formit->config, 'mailRows');
$emailHtml = (boolean)$modx->getOption('emailHtml', $formit->config, true);
$emailConvertNewlines = (boolean)$modx->getOption('emailConvertNewlines', $formit->config, false);

/* get from name */
$emailFrom = $modx->getOption('emailFrom', $formit->config, '');

if (empty($emailFrom)) {
    $emailFrom = !empty($fields['email']) ? $fields['email'] : $modx->getOption('emailsender');
}

$emailFrom = _process($emailFrom, $modx, $fields);
$emailFromName = $modx->getOption('emailFromName', $formit->config, $emailFrom);
$emailFromName = _process($emailFromName, $modx, $fields);

/* get returnPath */
$emailReturnPath = $modx->getOption('emailReturnPath', $formit->config, '');

if (empty($emailReturnPath)) {
    $emailReturnPath = $emailFrom;
}

$emailReturnPath = _process($emailReturnPath, $modx, $fields);

/* get subject */
$useEmailFieldForSubject = $modx->getOption('emailUseFieldForSubject', $formit->config, true);

if (!empty($fields['subject']) && $useEmailFieldForSubject) {
    $subject = $fields['subject'];
} else {
    $subject = $modx->getOption('emailSubject', $formit->config, '');
}

$subject = _process($subject, $modx, $fields);

/* check email to */
$emailTo = $modx->getOption('emailTo', $formit->config, '');
$emailToName = $modx->getOption('emailToName', $formit->config, $emailTo);

if (empty($emailTo)) {
    $errors['emailTo'] = $modx->lexicon('formit.email_no_recipient');
    $modx->log(modX::LOG_LEVEL_ERROR, '[FormIt] ' . $modx->lexicon('formit.email_no_recipient'));
    return false;
}

/* compile message */
$origFields = $fields;

if (empty($tplLayout)) {
    $tplLayout = 'mailLayout';
    $f = '';
    $multiSeparator = $modx->getOption('emailMultiSeparator', $formit->config, "\n");
    $multiWrapper = $modx->getOption('emailMultiWrapper', $formit->config, "[[+value]]");

    foreach ($fields as $k => $v) {
        if ($k == 'nospam') {
            continue;
        }
        if (is_array($v) && !empty($v['name']) && isset($v['error']) && $v['error'] == UPLOAD_ERR_OK) {
            $v = $v['name'];
            $f[$k] = '<strong>'.$k.'</strong>: '.$v.'<br />';
        } else if (is_array($v)) {
            $vOpts = array();
            foreach ($v as $vKey => $vValue) {
                if (is_string($vKey) && !empty($vKey)) {
                    $vKey = $k.'.'.$vKey;
                    $f[$vKey] = '<strong>'.$vKey.'</strong>: '.$vValue.'<br />';
                } else {
                    $vOpts[] = str_replace('[[+value]]', $vValue, $multiWrapper);
                }
            }
            $newValue = implode($multiSeparator, $vOpts);
            if (!empty($vOpts)) {
                $f[$k] = '<strong>'.$k.'</strong>:'.$newValue;
            }
        } else {
            $f[$k] = '<strong>'.$k.'</strong>: '.$v.'<br />';
        }
    }
    $fields['fields'] = implode("\n", $f);
} else {
    /* handle file/checkboxes in email tpl */
    $multiSeparator = $modx->getOption('emailMultiSeparator', $formit->config, "\n");
    if (empty($multiSeparator)) {
        $multiSeparator = "\n";
    }

    if ($multiSeparator == '\n') {
        $multiSeparator = "\n"; /* allow for inputted newlines */
    }

    $multiWrapper = $modx->getOption('emailMultiWrapper', $formit->config, "[[+value]]");
    if (empty($multiWrapper)) {
        $multiWrapper = '[[+value]]';
    }

    foreach ($fields as $k => &$v) {
        if (is_array($v) && !empty($v['name']) && isset($v['error']) && $v['error'] == UPLOAD_ERR_OK) {
            $v = $v['name'];
        } else if (is_array($v)) {
            $vOpts = array();
            foreach ($v as $vKey => $vValue) {
                if (is_string($vKey) && !empty($vKey)) {
                    $vKey = $k.'.'.$vKey;
                    $fields[$vKey] = $vValue;
                    unset($fields[$k]);
                } else {
                    $vOpts[] = str_replace('[[+value]]', $vValue, $multiWrapper);
                }
            }
            $v = implode($multiSeparator, $vOpts);
        }
    }
}

$contentString = "";

foreach ($fields as $key => $value) {
    $contentString .= $formit->getChunk($tplRows, array('label' => $key, 'value' => $value));
}

$message = $formit->getChunk($tplLayout, array('content' => $contentString));
$message = _process($message, $modx, $formit->config);

/* load mail service */
$modx->getService('mail', 'mail.modPHPMailer');

/* set HTML */
$modx->mail->setHTML($emailHtml);

/* set email main properties */
$modx->mail->set(modMail::MAIL_BODY, $emailHtml && $emailConvertNewlines ? nl2br($message) : $message);
$modx->mail->set(modMail::MAIL_FROM, $emailFrom);
$modx->mail->set(modMail::MAIL_FROM_NAME, $emailFromName);
$modx->mail->set(modMail::MAIL_SENDER, $emailReturnPath);
$modx->mail->set(modMail::MAIL_SUBJECT, $subject);

/* handle file fields */
$attachmentIndex = 0;
foreach ($origFields as $k => $v) {
    if (is_array($v) && !empty($v['tmp_name'])) {
        if (count($v['name']) > 1) {
            for ($i=0; $i < count($v['name']); ++$i) {
                if (isset($v['error'][$i]) && $v['error'][$i] == UPLOAD_ERR_OK) {
                    if (empty($v['name'][$i])) {
                        $v['name'][$i] = 'attachment'.$attachmentIndex;
                    }
                    $modx->mail->mailer->addAttachment($v['tmp_name'][$i], $v['name'][$i], 'base64', !empty($v['type'][$i]) ? $v['type'][$i] : 'application/octet-stream');
                    $attachmentIndex++;
                }
            }
        } else {
            if (isset($v['error']) && $v['error'] == UPLOAD_ERR_OK) {
                if (empty($v['name'])) {
                    $v['name'] = 'attachment'.$attachmentIndex;
                }
                $modx->mail->mailer->addAttachment($v['tmp_name'], $v['name'], 'base64', !empty($v['type']) ? $v['type'] : 'application/octet-stream');
                $attachmentIndex++;
            }
        }
    }
}

/* add to: with support for multiple addresses */
$emailTo = explode(',', $emailTo);
$emailToName = explode(',', $emailToName);
$numAddresses = count($emailTo);
for ($i=0; $i < $numAddresses; $i++) {
    $etn = !empty($emailToName[$i]) ? $emailToName[$i] : '';
    if (!empty($etn)) {
        $etn = _process($etn, $modx, $fields);
    }
    $emailTo[$i] = _process($emailTo[$i], $modx, $fields);
    if (!empty($emailTo[$i])) {
        $modx->mail->address('to', $emailTo[$i], $etn);
    }
}

/* reply to */
$emailReplyTo = $modx->getOption('emailReplyTo', $formit->config, $emailFrom);
$emailReplyTo = _process($emailReplyTo, $modx, $fields);
$emailReplyToName = $modx->getOption('emailReplyToName', $formit->config, $emailFromName);
$emailReplyToName = _process($emailReplyToName, $modx, $fields);
if (!empty($emailReplyTo)) {
    $modx->mail->address('reply-to', $emailReplyTo, $emailReplyToName);
}

/* cc */
$emailCC = $modx->getOption('emailCC', $formit->config, '');
if (!empty($emailCC)) {
    $emailCCName = $modx->getOption('emailCCName', $formit->config, '');
    $emailCC = explode(',', $emailCC);
    $emailCCName = explode(',', $emailCCName);
    $numAddresses = count($emailCC);
    for ($i=0; $i < $numAddresses; $i++) {
        $etn = !empty($emailCCName[$i]) ? $emailCCName[$i] : '';
        if (!empty($etn)) {
            $etn = _process($etn, $modx, $fields);
        }
        $emailCC[$i] = _process($emailCC[$i], $modx, $fields);
        if (!empty($emailCC[$i])) {
            $modx->mail->address('cc', $emailCC[$i], $etn);
        }
    }
}

/* bcc */
$emailBCC = $modx->getOption('emailBCC', $formit->config, '');
if (!empty($emailBCC)) {
    $emailBCCName = $modx->getOption('emailBCCName', $formit->config, '');
    $emailBCC = explode(',', $emailBCC);
    $emailBCCName = explode(',', $emailBCCName);
    $numAddresses = count($emailBCC);
    for ($i=0; $i < $numAddresses; $i++) {
        $etn = !empty($emailBCCName[$i]) ? $emailBCCName[$i] : '';
        if (!empty($etn)) {
            $etn = _process($etn, $modx, $fields);
        }
        $emailBCC[$i] = _process($emailBCC[$i], $modx, $fields);
        if (!empty($emailBCC[$i])) {
            $modx->mail->address('bcc', $emailBCC[$i], $etn);
        }
    }
}

/* send email */
if (!$formit->inTestMode) {
    $sent = $modx->mail->send();
} else {
    $sent = true;
}
$modx->mail->reset(array(
    modMail::MAIL_CHARSET => $modx->getOption('mail_charset', null, 'UTF-8'),
    modMail::MAIL_ENCODING => $modx->getOption('mail_encoding', null, '8bit'),
));

if (!$sent) {
    $errors[] = $modx->lexicon('formit.email_not_sent').' '.print_r($modx->mail->mailer->ErrorInfo, true);
    $modx->log(modX::LOG_LEVEL_ERROR, '[FormIt] '.$modx->lexicon('formit.email_not_sent').' '.print_r($modx->mail->mailer->ErrorInfo, true));
}

return $sent;

/**
 * Processes string and sets placeholders
 *
 * @param string $str The string to process
 * @param array $placeholders An array of placeholders to replace with values
 * @return string The parsed string
 */

function _process($str, $modx, array $placeholders = array())
{
    if (is_string($str)) {
        foreach ($placeholders as $k => $v) {
            if (is_scalar($k) && is_scalar($v)) {
                $str = str_replace('[[+'.$k.']]', $v, $str);
            }
        }
    }
    $modx->parser->processElementTags('', $str, true, false);
    return $str;
}