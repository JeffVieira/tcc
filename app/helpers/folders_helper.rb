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

end
