/**
 * jQuery PDF-DOC Plugin
 *
 * LICENSE
 *
 * This source file is subject to the Apache Licence, Version 2.0 that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://dev.funkynerd.com/projects/hazaar/wiki/licence
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@funkynerd.com so we can send you a copy immediately.
 *
 * @copyright   Copyright (c) 2012 Jamie Carl (http://www.funkynerd.com)
 * @license     http://dev.funkynerd.com/projects/hazaar/wiki/licence Apache Licence, Version 2.0
 * @version     0.7
 */

//PDFJS.workerSrc = '/pdfjs/pdf.worker.js';

// PDFJS.disableWorker = true;

(function ( $ ){
    $.fn.PDFDoc = function( options ) {

        var settings = $.extend( {
              'page'                : 1,
              'scale'               : 1
        }, options);

        if(!settings.source){

            $.error('No PDF document source was given');

            return this;

        }

        var mydoc = this;

        var page_count = 0;

        var scaling = false;

        mydoc.addClass('h-pdf-container');

        var canvas_container = $('<div>', { 'class' : 'h-pdf-canvas-container' } );

        function rescale(plus) {

            if (scaling) return false;
            scaling = true

            function round(value, decimals) {
                return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
            }

            var scale = mydoc.data('scale');

            if (plus) {
                scale = round(scale + plus, 2);
                if (scale < 0.2) scale = 0.2
            } else {
                scale = round(scale + 0.5, 2);
                if (scale > 1 && scale < 1.5) {
                    scale = 1.5;
                }
            }

            mydoc.data('scale', scale);

            renderPage(1, scale);

            $(mydoc).find('.h-pdf-zoom-select').val(scale);

        }

        canvas_container.dblclick(function(event) { rescale(false) });

        canvas_container.mousewheel(function(event) {
            event.preventDefault();
            rescale(event.deltaY * 0.5);
        });


        /*
         *Create the toolbar layouts
         */
        var toolbar = $('<div>', { 'class' : 'h-pdf-toolbar'});

        var toolbar_left = $('<div>', { 'class' : 'h-pdf-toolbar-left' } );

        var toolbar_right = $('<div>', { 'class' : 'h-pdf-toolbar-right' } );

        var toolbar_center = $('<div>').addClass('h-pdf-toolbar-center');

        toolbar.append(toolbar_left).append(toolbar_right).append(toolbar_center);

        mydoc.append(toolbar);


        /*
         * Create the page input
         */
        var page_text = $('<span>', { 'class' : 'h-pdf-pagetext', 'html' : 'Página:' } );

        // var page_input = $('<input>', { 'type' : 'text', 'class' : 'h-pdf-pageinput', 'value' : settings.page } );
        var page_input = $('<span>', { 'class' : 'h-pdf-pageactual', 'html' : "1"});

        var of_text = $('<span>', { 'class' : 'h-pdf-pagetext', 'html' : 'de ' });

        var pages_text = $('<span>', { 'class' : 'h-pdf-pagecount', 'html' : page_count});

        /*
         * Create the zoom droplist
         */
        var zoomModes = { 3 : '300%', 2 : '200%', 1.5 : '150%', 1 : '100%', 0.8 : "Padrão", 0.75 : '75%', 0.5 : '50%', 0.25 : '25%', 0.1 : '10%' };

        var zoom = $('<span>', { 'class' : 'h-pdf-zoom' } );

        var zoom_select = $('<select>', { 'class' : 'h-pdf-zoom-select'} );

        zoom.append(zoom_select);

        $.each( zoomModes, function(key, value) {

            var op = zoom_select.append($("<option></option>").attr("value",key).text(value));

        });

        zoom_select.change(function(){

           var scale = parseFloat($(this).val());

           renderPage(1, scale);

           mydoc.data('scale', scale);
        }).val(settings.scale);

        /*
         * Add the nav buttons, page input and zoom droplist to the center toolbar
         */
        toolbar_center.append($('<div>', { 'class' : 'h-pdf-toolbar-group' } ))
            .append(page_text)
            .append(page_input)
            .append(of_text)
            .append(pages_text)
            .append(zoom);

        toolbar.append($('<div>', { 'class' : 'h-pdf-toolbar-center-outer' } ).append(toolbar_center));

        // var but_rf = $('<div>', { 'class' : 'h-pdf-button h-pdf-refresh', 'title' : 'Atualizar' } );

        // but_rf.click(function() {
        //     alert('refresh');
        // })

        /*
         * Create the direct download button
         */
        var but_dl = $('<div>', { 'class' : 'h-pdf-button h-pdf-download', 'title' : 'Baixar arquivo' } );

        but_dl.click(function(){

            var url = settings.source;

            window.open(url, '_blank');

        });

        toolbar_right.append(but_dl);

        canvas_container.css('height',"100%");
        canvas_container.css('width',"780px");

        canvas_container.scroll(function(e) {
            var scroll_top = canvas_container.scrollTop();
            var canvas_height = canvas_container.find('canvas').first().height();
            var page = (scroll_top / canvas_height);

            $(mydoc).find('.h-pdf-pageactual').html(Math.round(page+0.7));
        })

        mydoc.append(canvas_container);

        function renderPage(the_page, scale) {
            var pdf = mydoc.data('pdf');

            var old_canvas = canvas_container.find('canvas');

            pdf.getPage(the_page).then(function(page) {

                var canvas = $('<canvas>', { 'class' : 'h-pdf-canvas'});

                canvas_container.append(canvas);

                canvas.data('page_num', the_page);

                canvas = canvas[0];

                var viewport = page.getViewport(scale);

                var context = canvas.getContext('2d');

                canvas.height = viewport.height;

                canvas.width = viewport.width;

                page.render( { canvasContext: context, viewport: viewport } ).then(function() {
                    if (the_page == page_count) {
                        scaling = false;
                        canvas_container.scroll();
                    }
                })

                if (the_page < page_count)
                    renderPage(the_page + 1, scale);

                // $(mydoc).find('.h-pdf-pageinput').val(the_page);
                if (the_page == 1)
                    old_canvas.remove();

            });
        }

        PDFJS.getDocument(settings.source).then(
            function getDocumentCallback(pdf) {

                page_count = pdf.numPages;

                $(mydoc).find('.h-pdf-pagecount').html(page_count);

                mydoc.data('pdf', pdf);

                var scale = mydoc.data('scale');

                renderPage(1, scale);

            }
        );

        this.data('current_page', settings.page);

        this.data('scale', settings.scale);

        return this;

    };
})( jQuery );
