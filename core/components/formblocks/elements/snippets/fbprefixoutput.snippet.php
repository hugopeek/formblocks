<?php
$id = $modx->resource->get('id');
$options = !empty($options) ? $options: 'fb' . $id . '-';

return $options.$input;