class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_enterpreneur
    id = nil
    if params[:controller] == 'enterpreneurs' and params[:action] == "show"
      id = params[:id]
    elsif params[:enterpreneur_id].present?
      id = params[:enterpreneur_id]
    end

    @current_enterpreneur ||= Enterpreneur.where(account: current_account, id: id).first if id and !current_account.nil?
  end

  def breadcrumb_for_create
    add_breadcrumb get_model.model_name.human(count: 2), self.controller_path
    add_breadcrumb "Novo registro - Revisão"
  end

  def breadcrumb_for_edit
    add_breadcrumb get_model.model_name.human(count: 2), self.controller_path
    add_breadcrumb "Edição de registro - Revisão"
  end

  def get_model
    self.controller_name.classify.constantize
  end

end
