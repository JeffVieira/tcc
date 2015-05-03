if (window.Ged === undefined) window.Ged = {};

Ged.documents = {

    show: function() {
        var priv = {};
        var pub = {};

        pub.init = function() {
          pub.show_pdf( $('#url a').attr('href') );
        }

        pub.show_pdf = function(url){
          //PDFJS.workerSrc = '../pdfjs/pdf.worker.js';
          PDFJS.workerSrc = '/assets/pdfjs/pdf.worker.js';

          PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
            //
            // Fetch the first page
            //
            pdf.getPage(1).then(function getPageHelloWorld(page) {
              var scale = 1.5;
              var viewport = page.getViewport(scale);

              //
              // Prepare canvas using PDF page dimensions
              //
              var canvas = document.getElementById('pdf_preview');
              var context = canvas.getContext('2d');
              canvas.height = viewport.height;
              canvas.width = viewport.width;

              //
              // Render PDF page into canvas context
              //
              var renderContext = {
                canvasContext: context,
                viewport: viewport
              };
              page.render(renderContext);
            });
          });
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

Ged.documents.show = Ged.documents.show;
Ged.documents.index = Ged.documents.search = Ged.documents.update = Ged.documents.checkin =
    Ged.documents.create = Ged.documents.new = Ged.documents.edit = Ged.documents.common;
