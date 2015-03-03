module ApplicationHelper

  def edit_buttom(link="#")
    link_to link, class: "btn btn-success", title: "Editar", data: {toggle: "tooltip", placement: "bottom"} do
      "<i class='fa fa-pencil'></i>".html_safe
    end
  end

  def admin_link(link="#",text="Novo" , icon="fa-angle-double-right")
    nav_link link do
        ("<i class='fa #{icon}'></i>"+
        text).html_safe
    end
  end
end
