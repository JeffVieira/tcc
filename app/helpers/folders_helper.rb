module FoldersHelper

  def link_to_back(text="..", option={})
    link_to text , (@folder.parent_id.present?)? folder_path(@folder.parent) : root_path
  end

  def icon(folder)
    content_tag(:i, " " , class:"fa "+folder.icon).html_safe
  end

  def li_empty
    if @folder.folders.blank?
      content_tag(:li, link_to_back("Vazio").html_safe, style: "color: red;")
    else
      content_tag(:li, link_to_back("Voltar") )
    end
  end

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


end
