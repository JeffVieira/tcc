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

  def button_new_document(folder)
    link_to new_document_path(folder_id: folder.id, current_folder_id:folder.id), class:'btn btn-primary btn-block'  do
      "<span class='fa fa-plus'></span> Novo documento".html_safe
    end if current_user.can?('document:new')
  end

end
