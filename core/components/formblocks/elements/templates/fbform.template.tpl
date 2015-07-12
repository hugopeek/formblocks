[[*pagetitle:fbStripAsAlias:toPlaceholder=`title`]]

[[!FormIt?
    &hooks=`spam,email,[[++formblocks.formit_save_form:eq=`1`:then=`FormItSaveForm,`]]redirect`
    &emailTpl=`[[*fb_email_template:empty=`fbEmail`]]`
    &emailTo=`[[*fb_email_to:empty=`[[++client_email:empty=`[[++email_sender]]`]]`]]`
    &emailSubject=`[[*fb_email_subject:empty=`[[%formblocks.email.subject]]`]]`

    &customValidators=`requiredIf,requiredIfNot`
    &validate=`
        [[!fbEmailGetJSON:fbValidateProcessJSON? &formID=`[[*id]]`]]
        [[$fbValidateCustomFields:notempty=`[[$fbValidateCustomFields]]`]]
        workemail:blank`
    &placeholderPrefix=`fb[[*id]].`
    &submitVar=`submit-[[+title]]`
    &redirectTo=`[[*fb_redirect_id]]`
]]

[[-
<h3>Raw output of validation scripts</h3>
<div class="row">
    <div class="col-md-12">
        [[!fbEmailGetJSON:fbValidateProcessJSON? &formID=`[[*id]]`]]
    </div>
    <div class="col-md-12">
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_input_textfield_id]]`]]
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_input_textarea_id]]`]]
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_option_id]]`]]
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_option_collapse_id]]`]]
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_dropdown_id]]`]]
        [[cbGetFieldContent:fbValidateProcessJSON:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_dropdown_auto_id]]`]]
        [[cbGetFieldContent:notempty=`fb[[*id]]-accept-terms:required,`? &field=`[[++formblocks.cb_field_accept_terms_id]]`]]
        [[$fbValidateCustomFields]]
        <br/><br/>
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_input_textfield_id]]`]]
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_input_textarea_id]]`]]
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_option_id]]`]]
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_option_collapse_id]]`]]
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_dropdown_id]]`]]
        [[cbGetFieldContent:stripString=`[]`? &returnAsJSON=`1` &fieldSettingFilter=`field_required==1` &field=`[[++formblocks.cb_field_select_dropdown_auto_id]]`]]
    </div>
</div>
]]

[[!+fb[[*id]].validation_error_message:notempty=`
<div class="alert alert-danger">
    <button type="button" class="icon close" data-dismiss="alert"></button>
    [[%formblocks.form.validation_error]]
    [[!+fb[[*id]].validation_error_message]]
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