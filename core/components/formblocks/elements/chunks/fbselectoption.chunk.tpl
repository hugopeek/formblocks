[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]

<div id="[[+name]]" class="form-group [[+field_type]]-group [[+option_other:notempty=`other`]] [[!+fb[[*id]].error.[[+name]]:notempty=`has-error`]]">
    <label for="[[+name]]" class="control-label [[+field_layout:is=`form-horizontal`:then=`col-sm-4`:else=`form-default`]]">[[+field_name]][[+field_required:is=`1`:then=`<span class="required">*</span>`]]</label>
    <div class="[[+field_layout:is=`form-horizontal`:then=`col-sm-8`:else=`form-default`]]">
        [[!+fb[[*id]].error.[[+name]]:notempty=`<span class="label label-danger">[[!+fb[[*id]].error.[[+name]]]]</span>`]]
        [[+rows]]

        [[+option_other:is=`1`:then=`
        <div class="[[+field_type]] other">
            <label>
                <input type="[[+field_type]]"
                       name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
                       id="[[+name]]-last"
                       class="collapse-other"
                       value="[[+option_other_value]]"
                       data-group="no-group"
                       data-target="[[+name]]-other"
                [[+field_helptext:notempty=`aria-describedby="[[+name]]-help"`]]
                [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+option_other_value]]`]]
                >
                [[+option_other_value]]
            </label>

            <div id="[[+name]]-other" class="collapse">
                <input type="text" class="form-control" name="[[+name]]-other" value="[[!+fb[[*id]].[[+name]]-other]]" placeholder="[[+option_other_placeholder]]" autofocus>
            </div>
        </div>
        `]]

        [[+field_helptext:notempty=`<span id="[[+name]]-help" class="help-block">[[+field_helptext]]</span>`]]
    </div>
</div>