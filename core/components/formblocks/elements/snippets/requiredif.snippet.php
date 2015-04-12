<?php
/**
 * requiredIf
 * FormIt custom validator. Will require the field when the given fieldname isset and not empty
 * 
 * Usage:
 *  &validate=`yourfield:requiredIf=^otherfield^`
 * Or with (simple) conditions to the value
 *  &validate=`yourfield:requiredIf=^otherfield==value^`
 * Possible conditions: == / != / > / < / >= / <=
 * 
 * To set an custom error text; use like default ones;
 *  &vTextRequiredIf=`Your custom error text!`
 *  &yourfield.vTextRequiredIf=`Your specific custom error text!`
 *
 *  NOTE: Add to FormIt with &customValidators=`requiredIf`
 * 
 * @author Bert Oost at OostDesign.nl <bert@oostdesign.nl>
 */

$paramOperator = false;
$paramAgainst = false;

if (stristr($param, '==') !== false) {
    $paramOperator = '==';
} else if (stristr($param, '!=') !== false) {
    $paramOperator = '!=';
} else if (stristr($param, '>') !== false) {
    $paramOperator = '>';
} else if (stristr($param, '<') !== false) {
    $paramOperator = '<';
} else if (stristr($param, '>=') !== false) {
    $paramOperator = '>=';
} else if (stristr($param, '<=') !== false) {
    $paramOperator = '<=';
}
if ($paramOperator !== false) {
    list($param, $paramAgainst) = explode($paramOperator, $param);
}

// get the value to compare against
$againstValue = (isset($validator->fields[$param])) ? $validator->fields[$param] : false;

// conditional check
if ($paramAgainst && $paramOperator) {
    if (
        eval("return ($paramAgainst $paramOperator $againstValue);") && (
            (!empty($againstValue) && !is_array($value) && empty($value)) ||
            (!empty($againstValue) && is_array($value) && isset($value['size']) && $value['size'] == 0) // assume it's an image/file upload
        )
    ) {
        $validator->addError($key, $validator->_getErrorMessage($key, 'vTextRequiredIf', 'This field is required!'));
        return false;
    }
} else {
    if (
        (!empty($againstValue) && !is_array($value) && empty($value)) ||
        (!empty($againstValue) && is_array($value) && isset($value['size']) && $value['size'] == 0) // assume it's an image/file upload
    ) {
        $validator->addError($key, $validator->_getErrorMessage($key, 'vTextRequiredIf', 'This field is required!'));
        return false;
    }
}

return true;