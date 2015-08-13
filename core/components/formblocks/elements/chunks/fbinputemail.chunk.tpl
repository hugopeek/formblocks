<div class="form-group [[!+fb[[*id]].error.fb[[*id]]-email:notempty=`has-error`]]">
    <label for="fb[[*id]]-email" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`form-default`]]">[[+field_name:stripWords=`[[$fbStripWordsLabel]]`]]<span class="required">*</span></label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`form-default`]]">
        [[!+fb[[*id]].error.fb[[*id]]-email:notempty=`<span class="label label-danger">[[!+fb[[*id]].error.fb[[*id]]-email]]</span>`]]
        <input type="email" class="form-control" name="fb[[*id]]-email" id="fb[[*id]]-email" value="[[!+fb[[*id]].fb[[*id]]-email]]" placeholder="[[+field_placeholder]]" [[+field_helptext:notempty=`aria-describedby="fb[[*id]]-email-help"`]]>
        [[+field_helptext:notempty=`<span id="fb[[*id]]-email-help" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>