[[!FormIt?
    &hooks=`spam,formBlocksEmail,redirect`
    &emailTpl=`formBlocksEmail`
    &emailTo=`[[*form_email_to:empty=`[[++client_email]]`]]`
    &emailSubject=`[[*form_email_subject]]`
    &validate=`
        je-naam:required,
        workemail:blank`
    &submitVar=`submit-[[*pagetitle:lcase:replace=` ==-`]]`
    &redirectTo=`[[*form_redirect]]`
]]

[[!+fi.validation_error_message:notempty=`
<div class="alert alert-danger">
    <button type="button" class="icon close" data-dismiss="alert"></button>
    [[%site.forms.validation_error_message]]
</div>
`]]

<form id="form-[[*pagetitle:lcase:replace=` ==-`]]" class="form-horizontal" action="[[~[[+currentID]]]]" method="post" enctype="multipart/form-data">
    <input type="text" name="workemail" class="hidden" value="">

    [[*content]]

    <fieldset>
        <div class="form-group submit">
            <div class="col-sm-offset-4 col-sm-8">
                <input type="submit" value="[[%site.forms.submit_value]]" name="submit-[[*pagetitle:lcase:replace=` ==-`]]" class="btn btn-primary">
            </div>
        </div>
    </fieldset>
</form>