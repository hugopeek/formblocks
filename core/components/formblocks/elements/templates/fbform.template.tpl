[[*pagetitle:fbStripAsAlias:toPlaceholder=`title`]]

[[!FormIt?
    &hooks=`spam,fbEmail,redirect`
    &emailLayoutTpl=`[[*fb_email_template:empty=`fbEmail`]]`
    &emailRowTpl=`[[*fb_email_template_rows:empty=`fbEmailRow`]]`
    &emailTo=`[[*fb_email_to:empty=`[[++client_email:empty=`[[++email_sender]]`]]`]]`
    &emailSubject=`[[*fb_email_subject:empty=`[[%formblocks.email.subject]]`]]`
    &validate=``
    &submitVar=`submit-[[+title]]`
    &redirectTo=`[[*fb_redirect_id]]`
]]

[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_input_textfield_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]
[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_input_textarea_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]
[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_select_option_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]
[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_select_option_collapse_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]
[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_select_dropdown_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]
[[-cbGetFieldContent? &field=`[[++formblocks.cb_field_select_dropdown_auto_id]]` &tpl=`fbValidateRow` &fieldSettingFilter=`field_required==1`]]

[[!+fi.validation_error_message:notempty=`
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
                <button type="submit" name="submit-[[+title]]" class="btn btn-primary">[[*fb_submit_button:default=`[[%formblocks.form.submit_button]]`]]</button>
            [[*fb_form_layout:is=`form-horizontal`:then=`</div>`]]
        </div>
    </fieldset>
</form>

[[fbLoadAssets]]