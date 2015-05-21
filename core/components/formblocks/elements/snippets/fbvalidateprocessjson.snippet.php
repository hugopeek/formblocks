<?php
$array = $modx->fromJSON($input);
$id = $modx->resource->get('id');
$prefix = !empty($prefix) ? $prefix: 'fb' . $id . '-';
$emailField = $modx->getOption('emailField', 'E-mail');

//$jsonString = $modx->getOption('json', $scriptProperties);
//$array = json_decode($jsonString, true);

if (!function_exists('search')) {
    function search($array, $key, $value)
    {
        $results = array();

        if (is_array($array)) {
            if (isset($array[$key]) && $array[$key] == $value) {
                $results[] = $array;
            }

            foreach ($array as $subarray) {
                $results = array_merge($results, search($subarray, $key, $value));
            }
        }

        return $results;
    }
}

$results = search($array, 'field_required', '1');

if (!function_exists('stripResults')) {
    function stripResults($row) {
        $row = strip_tags($row); // strip HTML
        $row = strtolower($row); // convert to lowercase
        $row = preg_replace('/[^\.A-Za-z0-9 _-]/', '', $row); // strip non-alphanumeric characters
        $row = preg_replace('/\s+/', '-', $row); // convert white-space to dash
        $row = preg_replace('/-+/', '-', $row);  // convert multiple dashes to one
        $row = trim($row, '-'); // trim excess

        return $row;
    }
}

$names = array();

foreach ($results as $result) {
    if ($result['field_name'] == $emailField) {
        $names[] = "e-mail:email:required,";
    } else {
        $names[] = $prefix . stripResults($result['field_name']) . ":required,";
    }
}

return implode('', $names);