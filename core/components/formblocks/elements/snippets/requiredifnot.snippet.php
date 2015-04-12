<?php
/**
 * requiredIfNot
 * FormIt custom validator. Will require the field when the given fieldname NOT isset and not empty
 * 
 * Usage:
 *  &validate=`yourfield:requiredIfNot=^otherfield^`
 * To set an custom error text; use like default ones;
 *  &vTextRequiredIfNot=`Your custom error text!`
 *
 *  NOTE: Add to FormIt with &customValidators=`requiredIfNot`
 * 
 * @author Bert Oost at OostDesign.nl <bert@oostdesign.nl>
 */
 
$againstValue = (!isset($validator->fields[$param])) ? true : false;
if(
    (!empty($againstValue) && !is_array($value) && empty($value)) ||
    (!empty($againstValue) && is_array($value) && isset($value['size']) && $value['size'] == 0) // assume it's an image/file upload
) {
    $validator->addError($key, $validator->_getErrorMessage($key,'vTextRequiredIfNot','This field is required!'));
    return false;
}
 
return true;