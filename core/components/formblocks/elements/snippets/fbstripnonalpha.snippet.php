<?php
$input = preg_replace('/[\&]/', '[and]', $input);
$input = preg_replace('/[\?]/', '[qmark]', $input);
$input = preg_replace('/[\;]/', '[semicolon]', $input);
$input = preg_replace('/[\=]/', '[equals]', $input);
$input = preg_replace('/[\`]/', '', $input);

return $input;