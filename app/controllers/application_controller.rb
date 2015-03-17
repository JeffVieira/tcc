class ApplicationController < ActionController::Base
  include Index, New, Edit, Update, Create, Destroy, Search
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :get_side_bar_files

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def get_side_bar_files
    @side_bar_files = Folder.get_father
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password)
    }
  end

  def breadcrumb_for_actions(description=nil)
    add_breadcrumb get_model.model_name.human(count: 2), "/"+self.controller_path
    add_breadcrumb description unless description.nil?
  end

  def get_model
    self.controller_name.classify.constantize
  end

  def get_variable
    '@'+self.controller_name.singularize
  end

  def get_object
    object = get_model.where(id: params[:id]).first

    if object.nil?
      flash[:error] = "Registro não encontrado"
      if params[:enterpreneur_id].present?
        redirect_to "/enterpreneurs/" + params[:enterpreneur_id] + "/" + self.controller_path and return
      else
        redirect_to "/" + self.controller_path and return
      end
    end

    object
  end

end
