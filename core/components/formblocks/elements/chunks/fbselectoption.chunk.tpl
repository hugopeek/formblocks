[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="form-group [[+field_type]]-group [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`form-default`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`form-default`]]">
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        [[+rows]]
        [[+field_helptext:notempty=`<span id="help-[[+name]]" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>