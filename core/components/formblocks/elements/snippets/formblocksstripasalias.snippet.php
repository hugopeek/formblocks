<?php
$input = strip_tags($input); // strip HTML
$input = strtolower($input); // convert to lowercase
$input = preg_replace('/[^\.A-Za-z0-9 _-]/', '', $input); // strip non-alphanumeric characters
$input = preg_replace('/\s+/', '-', $input); // convert white-space to dash
$input = preg_replace('/-+/', '-', $input);  // convert multiple dashes to one
$input = trim($input, '-'); // trim excess

return $input;