[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div class="form-group textarea [[!+fb[[*id]].error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`form-default`]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`form-default`]]">
        [[!+fb[[*id]].error.[[+name]]:notempty=`<span class="label label-danger">[[!+fb[[*id]].error.[[+name]]]]</span>`]]
        <textarea rows="[[+field_rows]]" class="form-control" name="[[+name]]" id="[[+name]]" placeholder="[[+field_placeholder]]" [[+field_helptext:notempty=`aria-describedby="help-[[+name]]"`]]>[[!+fb[[*id]].[[+name]]]]</textarea>
        [[+field_helptext:notempty=`<span id="help-[[+name]]" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>