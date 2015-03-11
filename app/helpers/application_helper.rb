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

  def admin_link(link="#",text="Novo" , icon="fa-angle-double-right")
    nav_link link do
        ("<i class='fa #{icon}'></i>"+
        text).html_safe
    end
  end

  def info_box(text="",quantity=0, color="", icon="")
    content_tag(:div, :class=>'info-box' ) do
      concat(content_tag(:span, content_tag(:i, " ",:class=>"fa #{icon}"),:class=>"info-box-icon #{color}"))
      concat(content_tag(:div, :class=>"info-box-content") do
        concat(content_tag(:span, text, :class=>"info-box-text"))
        concat(content_tag(:span, quantity, :class=>"info-box-number"))
      end)
    end.html_safe
  end
end
