[[*pagetitle:fbStripAsAlias:toPlaceholder=`title`]]

[[!FormIt?
    &hooks=`spam,email,[[++formblocks.formit_save_form:eq=`1`:then=`FormItSaveForm,`]]redirect`

    &emailTpl=`[[*fb_email_template:empty=`fbEmail`]]`
    &emailTo=`[[*fb_email_to:empty=`[[++client_email:empty=`[[++email_sender]]`]]`]]`
    &emailFrom=`[[*fb_email_from:empty=`[[++email_sender]]`]]`
    &emailFromName=`[[*fb_email_from_name:empty=`[[++site_name]]`]]`
    &emailReplyTo=`fb[[*id]]-email`
    &emailSubject=`[[*fb_email_subject:empty=`[[%formblocks.email.subject]]`]]`

    [[*fb_autoresponder:notempty=`
    &fiarTpl=`fbAutoresponder`
    &fiarToField=`fb[[*id]]-email`
    &fiarFrom=`[[*fb_autoresponder_from:empty=`[[++email_sender]]`]]`
    &fiarFromName=`[[*fb_autoresponder_from_name:empty=`[[++site_name]]`]]`
    &fiarReplyTo=`[[*fb_autoresponder_reply_to:empty=`[[++client_email:empty=`[[++email_sender]]`]]`]]`
    &fiarSubject=`[[*fb_autoresponder_subject:empty=`[[%formblocks.autoresponder.subject]]`]]`
    `]]

    &customValidators=`requiredIf,requiredIfNot`
    &validate=`
        [[!fbValidateProcessJson? &json=`[[!fbEmailGetJSON? &formID=`[[*id]]`]]`]]
        [[cbGetFieldContent:notempty=`fb[[*id]]-email:email:required,`? &field=`[[++formblocks.cb_field_input_email_id]]`]]
        [[$fbValidateCustomFields:notempty=`[[$fbValidateCustomFields]]`]]
        workemail:blank`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[+title]]`
    &redirectTo=`[[*fb_redirect_id]]`
]]

[[!+fb[[*id]].validation_error_message:notempty=`
<div class="alert alert-danger">
    <button type="button" class="icon close" data-dismiss="alert"></button>
    [[%formblocks.form.validation_error]]
</div>
`]]

<form id="form-[[+title]]" class="[[*fb_form_layout]]" name="fb[[*id]]" action="[[~[[+currentID]]]]" method="post" enctype="multipart/form-data">
    <input type="text" name="workemail" class="hidden" value="">

    [[*content]]

    <fieldset>
        <div class="form-group submit">
            [[*fb_form_layout:is=`form-horizontal`:then=`<div class="col-sm-offset-4 col-sm-8">`]]
                <button type="submit" name="submit-[[+title]]" value="submit" class="btn btn-primary">[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]</button>
            [[*fb_form_layout:is=`form-horizontal`:then=`</div>`]]
        </div>
    </fieldset>
</form>

[[fbLoadAssets]]