## Limitations

### Unable to validate fields inside show/hide fieldsets

Please make sure that none of the fields inside a collapsible fields is required.

### Unable to handle duplicate labels / fieldnames

There is a quickfix available: just add a _suffix with a number ranging from 2-10 to the label name. So if you want to have 2 labels called Name in your form, add the first one as *Name* and the second one as *Name_2*.

### The Email template rows TV under Settings - Advanced doesn't work

Overruling the default email tpl should work, but the rows are defined now using fbSimplxWidgeteer. So if you want to edit the individual rows for each field type, look there..

## Roadmap

- Fix RequiredIf validation
- Automatically give fields a unique ID, to fix duplicate label issue
- Add ability to create multi-page forms
- Collect form input in confirmation page before submitting
- Add front-end validation to required fields
- Show which fields were not filled in validation error message
- Also add collapsible (show/hide) form parts inside of fieldsets
