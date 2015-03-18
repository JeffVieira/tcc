if (window.Ged === undefined) window.Ged = {};


Ged.only_number = function(field) {
    field.keydown(function(e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    }).blur(function() {
        $(this).val($(this).val().replace(/[^0-9]+/g, ''));
    });
}

Ged.make_date_field = function(field){
  field.datepicker({autoclose: true, language: "pt-BR", format: 'dd/mm/yyyy', todayHighlight: true });
}
