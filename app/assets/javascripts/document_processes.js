if (window.Ged === undefined) window.Ged = {};

Ged.document_processes = {

    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
          $("#document_types a.add_fields").
            data("association-insertion-position", 'before').
            data("association-insertion-node", 'this');

          $('#document_types').bind('cocoon:after-insert',
            function(e, tag) {
              $(".relation-fields a.add_fields").
                   data("association-insertion-position", 'before').
                   data("association-insertion-node", 'this');
              $('.relation-fields').bind('cocoon:after-insert',
                  function() {
                    console.log(this);
                    $(this).children("#document_type_from_list").remove();
                    $(this).children("div.col-md-4").find("a.add_fields").hide();
                    $(this).children("div.col-md-4").addClass('col-md-10');
                    $(this).children("div.col-md-4").removeClass('col-md-4');
              });
          });
      }

        return pub;
    }()
};

Ged.document_processes.index = Ged.document_processes.search =
Ged.document_processes.update = Ged.document_processes.create =
Ged.document_processes.new = Ged.document_processes.edit = Ged.document_processes.common;

