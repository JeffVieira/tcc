if (window.Ged === undefined) window.Ged = {};

Ged.documents = {

    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
            $('input.datepicker').datepicker({autoclose: true, language: "pt-BR", format: 'dd/mm/yyyy', todayHighlight: true });
        }

        return pub;
    }()
};

Ged.documents.index = Ged.documents.search = Ged.documents.update =
    Ged.documents.create = Ged.documents.new = Ged.documents.edit = Ged.documents.common =
    Ged.documents.checkin;
