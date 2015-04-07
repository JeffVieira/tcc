class DocumentsController < ApplicationController
  before_filter :get_user_groups,:get_document_type,:get_folders,  :only => [:new, :edit, :create, :update, :checkin]

  before_action only: [:create] do
    create_history("create")
  end

  layout "home", only: :show

  def new
    breadcrumb_for_actions("novo")
    @document = Document.new(user_id: current_user.id, folder_id: params[:folder_id], status: 1)
  end

  def show
    @document = Document.find(params[:id])
    @folder = @document.folder
    @folders = @folder.documents

    add_all_parent_breadcrumb(@document.folder) unless @document.folder_id.nil?
    add_breadcrumb @document.name

    respond_to do |format|
      format.html
      format.js
    end
  end

  def checkout
    @document = Document.find(params[:id])
    @document.update_attributes(:status=>2)
    create_history("CheckOut")

    redirect_to "#{document_path(@document)}#info"
  end

  def validar
    @document = Document.find(params[:id])
    @new_doc = @document.checkins.last

    @notification = Notification.new
  end

  def validar_create
    @document = Document.find(params[:document_id])
    if params[:notify] == "Aceitar"
      doc_new = @document.checkins.last
      @document.update_attributes(status: 1, do_version: true,
        name: doc_new.name,
        date_validity: doc_new.date_validity,
        notification_period: doc_new.notification_period,
        document_type_id: doc_new.document_type_id,
        folder_id: doc_new.folder_id)
      create_history("Nova versão aceita")
    else
      @document.update_attributes(status: 1, do_version: false)
      create_history("Nova versão rejeitada")
    end
    Notification.create(notification_params)

    redirect_to  document_path(@document)
  end

  def download
    @document = Document.find(params[:id])
    send_data @document.arquivo
  end

  private
    def create_history(action, document_id=nil)
      DocumentHistory.create(document_id: document_id||@document.id, user_id: current_user.id, action: action) unless document_id.blank? && @document.blank?
    end

    def get_user_groups
      @user_groups = UserGroup.all||{}
    end

    def get_document_type
      process = Folder.find(params[:folder_id]) unless params[:folder_id].blank?

      @document_type = DocumentType.all
    end

    def get_folders
      process = Folder.find(params[:folder_id]) unless params[:folder_id].blank?

      @folders = Folder.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :date_validity, :checkout, :notification_period, :user_id, :arquivo, :folder_id, :document_type_id, :id_to_redirect, :document_id, :status)
    end

    def notification_params
      params.require(:notification).permit(:description, :user_id, :autor_id)
    end
end
