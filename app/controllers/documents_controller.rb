class DocumentsController < ApplicationController
  before_filter :get_user_groups,:get_document_type,:get_folders,  :only => [:new, :edit, :create, :update, :checkin]

  def new
    breadcrumb_for_actions("novo")
    @document = Document.new(user_id: current_user.id, folder_id: params[:id_to_redirect] || params[:folder_id], status: 1)
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      create_history("Criado")
      flash[:notice] = "Registro criado com sucesso"

      if params[:id_to_redirect].blank?
        redirect_to documents_path
      else
        redirect_to folder_path(params[:id_to_redirect])
      end
    else
      breadcrumb_for_actions("Novo")

      render :new
    end
  end

  def show
    @document = Document.find(params[:id])

    add_all_parent_breadcrumb(@document.folder) unless @document.folder_id.nil?
    add_breadcrumb @document.name
  end

  def checkout
    @document = Document.find(params[:id])
    @document.update_attributes(:status=>2)
    create_history("CheckOut")

    redirect_to "#{document_path(@document)}#info"
  end

  def checkin
    breadcrumb_for_actions("CheckIn")
    @version = Document.find(params[:document_id])
    @document = Document.new(document_id: params[:document_id], user_id: current_user.id, folder_id: @version.folder_id, document_type_id: @version.document_type_id, name:@version.name+" nova versão")
  end

  def checkin_create
    @document = Document.new(document_params)
    @document.old_version.update_attributes(status: 3)

    if @document.save
      create_history("CheckIn", @document.old_version.id)
      flash[:notice] = "CheckIn criado com sucesso"

      redirect_to document_path(@document.old_version)
    else
      breadcrumb_for_actions("checkIn")
      @version = Document.find(params[:document][:document_id])
      render :checkin
    end
  end

  def download
    @document = Document.find(params[:id])
    send_data @document.arquivo
  end

  private
    def create_history(action, document_id=nil)
      DocumentHistory.create(document_id: document_id||@document.id, user_id: current_user.id, action: action)
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
end
