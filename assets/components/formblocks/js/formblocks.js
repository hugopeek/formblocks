// Show/Hide containers

// Radio buttons
$('.collapse-radio').change(function() {

    // Get data attributes from input fields
    var group = $(this).data('group');
    var target = $(this).data('target');

    // Add group name to all target containers
    $("#" + target).addClass(group);

    // Show selected container, hide the rest
    if($(this).is(':checked')) {
        $('.' + group).removeClass("in");
        $('#' + target).addClass("in");
    }
});

// Checkboxes
$('.collapse-checkbox').click(function() {

    // Get data attributes from input fields
    var group = $(this).data('group');
    var target = $(this).data('target');

    // Add group name to all target containers
    $("#" + target).addClass(group);

    // Show selected container, hide the rest
    if($(this).is(':checked')) {
        $('#' + target).addClass("in");
    } else {
        $('#' + target).removeClass("in");
    }
});