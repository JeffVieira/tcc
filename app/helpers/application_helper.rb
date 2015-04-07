module ApplicationHelper

  def edit_buttom(link="#")
    link_to link, class: "btn btn-success", title: "Editar", data: {toggle: "tooltip", placement: "bottom"} do
      "<i class='fa fa-pencil'></i>".html_safe
    end
  end

  def destroy_buttom(link="#")
    link_to link, method: :delete, data: { confirm: 'Você tem certeza?', toggle: "tooltip", placement: "bottom" }, class: "btn btn-danger", title: "Excluir" do
      "<i class='fa fa-close'></i>".html_safe
    end
  end

  def show_buttom(link="#")
    link_to link,  data: { toggle: "tooltip", placement: "bottom" }, class: "btn btn-info", title: "Exibir" do
      "<i class='fa fa-folder-open-o'></i>".html_safe
    end
  end

  def admin_link(link="#",text="Novo" , icon="fa-plus")
    link_to link do
      ("<i class='fa #{icon}'></i>"+text).html_safe
    end
  end

  def file_link(file)
    if file.is_a?(Folder)
      link_to_folder(file)
    else
      link_to_file(file)
    end
  end

  def link_to_folder(file)
    treeview_link "<i class='fa #{file.icon}'></i> #{file.name}".html_safe do
      #concat(link_to_add_new_folder(file.id))
      file.folders.each do |folder|
        concat(link_to_folder(folder)).html_safe
      end
      #concat(link_to_add_new_file(file.id))
      file.documents.each do |document|
        concat(link_to_file(document)).html_safe
      end.join.html_safe
    end
  end

  def link_to_file(file)
    nav_link document_path(file) do
      ("<i class='fa #{file.icon}'></i>"+
      file.name).html_safe
    end
  end

  def link_to_add_new_folder(folder_id)
    nav_link new_folder_path(folder_id: folder_id) do
      ("<i class='fa fa-plus'></i> Novo diretório").html_safe
    end
  end

  def link_to_add_new_file(folder_id)
    nav_link new_document_path(folder_id: folder_id) do
      ("<i class='fa fa-plus'></i> Novo documento").html_safe
    end
  end

  def info_box(text="",quantity=0, color="", icon="")
    content_tag(:div, :class=>"small-box #{color}" ) do
      concat(content_tag(:div, :class=>"inne") do
        content_tag(:h3, quantity)+
        content_tag(:p, text)
      end)

      concat(content_tag(:div, :class=>"icon") do
        concat(content_tag(:i, "", :class=>"ion ion-bag"))
      end)
    end.html_safe
  end

end
