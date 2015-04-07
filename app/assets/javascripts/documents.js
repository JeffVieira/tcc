if (window.Ged === undefined) window.Ged = {};

Ged.documents = {

    show: function() {
        var priv = {};
        var pub = {};

        pub.init = function(file) {
            console.log(file);
            $('#pdf_preview').PDFDoc( { source : "/system/documents/arquivos/000/000/031/original/5_2015_-_Minuta_de_oficio_%28condicionante%29-242-.pdf", scale : 0.8 });
            pub.init_canvas_events();
        }

        pub.init_canvas_events = function() {
            var curDown = false,
                curYPos = 0,
                curXPos = 0;
            var container = $('#pdf_preview').find('.h-pdf-canvas-container');

            $(window).mousemove(function(m){
              if(curDown === true){
               container.scrollTop(container.scrollTop() + (curYPos - m.pageY));
               container.scrollLeft(container.scrollLeft() + (curXPos - m.pageX));
               curYPos = m.pageY;
               curXPos = m.pageX;
              }
            });

            container.mousedown(function(m){
              curDown = true;
              curYPos = m.pageY;
              curXPos = m.pageX;
              container.css("cursor", "-webkit-grabbing").css("cursor", "-moz-grabbing");
            });

            var disable_drag_scroll = function(){
              curDown = false;
              container.css("cursor", "-webkit-grab").css("cursor", "-moz-grab");
            };
            $(window).mouseup(disable_drag_scroll);
            $(window).mouseout(disable_drag_scroll);

        }

        return pub;
    }(),

    common: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
            $('input.datepicker').datepicker({autoclose: true, language: "pt-BR", format: 'dd/mm/yyyy', todayHighlight: true });
        }

        return pub;
    }()
};

//Ged.documents.show = Ged.documents.show;
Ged.documents.index = Ged.documents.search = Ged.documents.update = Ged.documents.checkin =
    Ged.documents.create = Ged.documents.new = Ged.documents.edit = Ged.documents.common;
