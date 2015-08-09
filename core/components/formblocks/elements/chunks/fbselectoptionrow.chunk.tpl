[[+field_name:fbStripAsAlias:fbPrefixOutput:toPlaceholder=`name`]]
[[+field_option:fbResetNonAlpha:toPlaceholder=`option`]]

[[+option_layout:isnot=`inline`:then=`
<div class="[[+field_type]]">
    <label>
`:else=`
    <label class="[[+field_type]]-inline">
`]]
        <input type="[[+field_type]]"
               name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]"
               id="[[+name]]-[[+idx]]"
               value="[[+option]]"
               class="[[+collapse_target:isnot=``:then=`collapse-[[+field_type]]`]]"
               data-group="[[+collapse_target:isnot=``:then=`[[+name]]`:default=`no-group`]]"
               data-target="[[+collapse_target:default=`no-target`]]"
               data-toggle="collapse"
               [[!+fb[[*id]].[[+name]]:FormItIsChecked=`[[+field_option]]`]]
               [[+field_helptext:notempty=`aria-describedby="[[+name]]-help"`]]
        >
        [[+option]]
    </label>
[[+option_layout:isnot=`inline`:then=`
</div>
`]]