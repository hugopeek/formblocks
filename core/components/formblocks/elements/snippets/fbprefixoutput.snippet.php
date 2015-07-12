<?php
$id = $modx->resource->get('id');
//$idx = $modx->getPlaceholder('unique_idx');
$options = !empty($options) ? $options: 'fb' . $id . '-';

return $options.$input;