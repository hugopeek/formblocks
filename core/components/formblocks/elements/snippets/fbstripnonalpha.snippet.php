<?php
$input = strip_tags($input); // strip HTML
$input = preg_replace('/[^\.A-Za-z0-9 _-]/', '', $input); // strip non-alphanumeric characters

return $input;