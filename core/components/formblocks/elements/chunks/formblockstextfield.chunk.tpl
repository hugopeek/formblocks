[[+field_name:lcase:replace=` ==-`:toPlaceholder=`name`]]

<div class="form-group textarea [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    [[+field_layout:is=`form-horizontal`:then=`<div class="col-sm-8">`]]
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        <textarea rows="[[+field_rows]]" class="form-control" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]">[[!+fi.[[+name]]]]</textarea>
    [[+field_layout:is=`form-horizontal`:then=`</div>`]]
</div>