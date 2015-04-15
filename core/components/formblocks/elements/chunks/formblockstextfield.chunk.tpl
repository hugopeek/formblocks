[[+field_name:lcase:replace=` ==-`:toPlaceholder=`name`]]

<div class="form-group [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    [[+field_layout:is=`form-horizontal`:then=`<div class="col-sm-8">`]]
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        <input type="[[+field_type]]" class="form-control" name="[[+name]]" id="[[+name]]" value="[[!+fi.[[+name]]]]" placeholder="[[+field_placeholder]]">
    [[+field_layout:is=`form-horizontal`:then=`</div>`]]
</div>