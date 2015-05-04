[[*pagetitle:stripAsAlias:toPlaceholder=`title`]]

[[!FormIt?
    &hooks=`spam,FormBlocksEmail,redirect`
    &emailTpl=`FormBlocksEmail`
    &emailTo=`[[*form_email_to:empty=`[[++client_email]]`]]`
    &emailSubject=`[[*form_email_subject]]`
    &validate=`
        naam:required,
        workemail:blank`
    &submitVar=`submit-[[+title]]`
    &redirectTo=`[[*form_redirect]]`
]]

[[!+fi.validation_error_message:notempty=`
<div class="alert alert-danger">
    <button type="button" class="icon close" data-dismiss="alert"></button>
    [[%formblocks.validation_error_message]]
</div>
`]]

<form id="form-[[+title]]" class="[[*form_layout]]" action="[[~[[+currentID]]]]" method="post" enctype="multipart/form-data">
    <input type="text" name="workemail" class="hidden" value="">

    [[*content]]

    <fieldset>
        <div class="form-group submit">
            [[*form_layout:is=`form-horizontal`:then=`<div class="col-sm-offset-4 col-sm-8">`]]
                <input type="submit" value="[[*form_submit_button:default=`Verzenden`]]" name="submit-[[+title]]" class="btn btn-primary">
            [[*form_layout:is=`form-horizontal`:then=`</div>`]]
        </div>
    </fieldset>
</form>

[[FormBlocksLoadAssets]]