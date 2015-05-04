[[+field_name:stripAsAlias:toPlaceholder=`name`]]

<div class="form-group textarea [[!+fi.error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`stacked`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`stacked`]]">
        [[!+fi.error.[[+name]]:notempty=`<span class="label label-danger">[[!+fi.error.[[+name]]]]</span>`]]
        <textarea rows="[[+field_rows]]" class="form-control" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]">[[!+fi.[[+name]]]]</textarea>
    </div>
</div>