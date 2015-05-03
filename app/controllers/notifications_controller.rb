class NotificationsController < ApplicationController
  def index
    breadcrumb_for_actions
  end

  def show
    @notification = Notification.find(params[:id])

    @notification.update_attributes(read: true)
    add_breadcrumb get_model.model_name.human(count: 2), "/"+self.controller_path
    add_breadcrumb "Minhas Notificações", notification_notifications_path
    add_breadcrumb @notification.description[0..10]
  end

  def notification
    breadcrumb_for_actions("Minhas Notificações")

    @user_notifications = current_user.notifications.unread.paginate(:page => params[:page])
  end

  def vencimento
    breadcrumb_for_actions("Vencimentos")

    #@vencendo = Document.vencendo(current_user.id).paginate(:page => params[:page])
    @vencendo = Document.vencidos(current_user.id).paginate(:page => params[:page])
  end

  def checkout
    breadcrumb_for_actions("Documento aguardando validação")

    @documents = Document.aguardando_validacao(current_user.id).paginate(:page => params[:page])
  end

  def read_all
    get_current_user_unread_notification
    @current_user_notifications.update_all(read: true) if @current_user_notifications.any?
    redirect_to notification_notifications_path
  end

  def delete_all
    get_current_user_unread_notification
    @current_user_notifications.delete_all if @current_user_notifications.any?
    redirect_to notification_notifications_path
  end

  private
  def get_current_user_unread_notification
    @current_user_notifications = current_user.notifications.unread
  end
end
