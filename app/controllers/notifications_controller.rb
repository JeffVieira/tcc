class NotificationsController < ApplicationController
  def index
    breadcrumb_for_actions
  end

  def notification
    breadcrumb_for_actions("Minhas Notificações")
  end

  def vencimento
    breadcrumb_for_actions("Vencimentos")
  end

  def checkout
    breadcrumb_for_actions("Documento aguardando validação")

    @documents = Document.aguardando_validacao(current_user.id)
  end
end
