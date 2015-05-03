class ApplicationController < ActionController::Base
  include Index, New, Edit, Update, Create, Destroy, Search
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!, :get_side_bar_files, :get_current_user_notifications, :check_current_folder

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def check_current_folder
    session[:current_folder_id] = params[:current_folder_id] if params[:current_folder_id].present?
  end

  def get_current_user_notifications
    if signed_in?
      @vencimentos = 0
      @checkouts = current_user.documents.aguardando_validacao(current_user.id).size
      @notifications = current_user.notifications.unread.size
    else
      @vencimentos = 0
      @checkouts = 0
      @notifications = 0
    end
  end

  def get_side_bar_files(folder_id=params[:current_folder_id])
    @side_bar_files = Folder.get_father
  end

  def add_all_parent_breadcrumb(folder)
    folder.get_parents.each do |parents|
      add_breadcrumb parents.name, folder_path(parents)
    end
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
