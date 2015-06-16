module DocumentsHelper

  def status_badge(status)
    case status
    when 1
      content_tag(:spam, Document::STATUS[status], class: "label label-success")
    when 2
      content_tag(:spam, Document::STATUS[status], class: "label label-danger")
    when 3
      content_tag(:spam, Document::STATUS[status], class: "label label-warning")
    else
      content_tag(:spam, Document::STATUS[status], class: "label label-info")
    end
  end

  def link_to_download
    #if @document.status == 1
      link_to @document.arquivo_file_name, @document.arquivo.url, target: "_blank"
      #link_to @document.arquivo_file_name, download_documents_path(id: @document.id)
    #else
    #  content_tag(:spam, "Link indisponivel.", class: "label label-danger", title: "Será possivel fazer download após CheckIn")
    #end
  end

  def button_action
    case @document.status
    when 1
      link_to "<i class='fa fa-anchor'></i> CheckOut".html_safe, checkout_documents_path(id:@document.id), class: "btn btn-block btn-primary" if current_user.can?('document:checkout')
    when 2
      link_to "<i class='fa fa-check-square'></i> CheckIn".html_safe, new_checkin_path(document_id:@document.id), class: "btn btn-block btn-primary" if current_user.can?('document:verssion')
    when 3
      link_to "<i class='fa fa-thumbs-up'></i> Validar".html_safe, validar_documents_path(id:@document.id), class: "btn btn-block btn-primary" if current_user.can?('document:validate')
    end
  end
end
