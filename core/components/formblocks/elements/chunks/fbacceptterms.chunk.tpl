<div id="fb[[*id]]-accept-terms" class="form-group accept-terms [[!+fi.error.fb[[*id]]-accept-terms:notempty=`has-error`]]">
    <div class="[[*fb_form_layout:is=`form-horizontal`:then=`col-sm-8 col-sm-offset-4`:else=`form-default`]]">
        [[!+fi.error.fb[[*id]]-accept-terms:notempty=`<span class="label label-danger">[[!+fi.error.fb[[*id]]-accept-terms]]</span>`]]
        <label class="checkbox-inline">
            <input type="checkbox" name="fb[[*id]]-accept-terms[]" id="fb[[*id]]-accept-terms-1" value="1" [[!+fi.fb[[*id]]-accept-terms:FormItIsChecked=`1`]]>
            [[+field_text:replace=`[[+link]]==<a href="[[~[[+link_id]]]]">[[+link_text]]</a>`]]<span class="required">*</span>
        </label>
    </div>
</div>