[[+field_name:lcase:replace=` ==-`:toPlaceholder=`name`]]

[[+option_layout:isnot=`inline`:then=`
<div class="[[+field_type]]">
    <label>
`:else=`
    <label class="[[+field_type]]-inline">
`]]
        <input type="[[+field_type]]" name="[[+name]][[+field_type:is=`checkbox`:then=`[]`]]" value="[[+field_option]]" [[+field_helptext:notempty=`aria-describedby="help-[[+name]]"`]]>
        [[+field_option]]
    </label>
[[+option_layout:isnot=`inline`:then=`
</div>
`]]