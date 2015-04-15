[[+field_name:lcase:replace=` ==-`:toPlaceholder=`name`]]

<div id="[[+name]]" class="form-group [[+field_type]]-group [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    [[+field_layout:is=`form-horizontal`:then=`<div class="col-sm-8">`]]
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        [[+rows]]
    [[+field_layout:is=`form-horizontal`:then=`</div>`]]
</div>