[[+field_name:fbStripAsAlias:toPlaceholder=`name`]]

[[+option_layout:isnot=`inline`:then=`
<div class="[[+field_type]]">
    <label>
`:else=`
    <label class="[[+field_type]]-inline">
`]]
        <input type="[[+field_type]]"
               name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
               id="[[+name]]-[[+idx]]"
               value="[[+field_option]]"
               class="[[+collapse_target:isnot=``:then=`collapse-[[+field_type]]`]]"
               data-group="[[+collapse_target:isnot=``:then=`[[+name]]`]]"
               data-target="[[+collapse_target]]"
               [[!+fi.[[+name]]:FormItIsChecked=`[[+field_option]]`]]
               [[+field_helptext:notempty=`aria-describedby="help-[[+name]]"`]]
        >
        [[+field_option]]
    </label>
[[+option_layout:isnot=`inline`:then=`
</div>
`]]