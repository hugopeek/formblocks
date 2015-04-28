[[+field_name:lcase:replace=` ==-`:toPlaceholder=`name`]]

<div class="form-group [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`stacked`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`stacked`]]">
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        <input type="file" class="form-control" name="[[+name]]" id="[[+name]]" [[+field_helptext:notempty=`aria-describedby="help-[[+name]]"`]]>
        [[+field_helptext:notempty=`<span id="help-[[+name]]" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>