class DocumentsController < ApplicationController

  def new
    breadcrumb_for_actions("novo")
    @document = Document.new(user_id: current_user.id, folder_id: params[:folder_id])
  end

  def get
    asset = current_user.assets.find_by_id(params[:id])
    if asset
        send_file asset.uploaded_file.path, :type => asset.uploaded_file_content_type
    else
        flash[:error] = "Don't be cheeky! Mind your own assets!"
        redirect_to assets_path
    end
  end

  def show
    @document = Document.find(params[:id])

    add_breadcrumb @document.folder.name, folder_path(@document.folder) unless @document.folder_id.nil?
    add_breadcrumb @document.name
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :date_validity, :checkout, :notification_period, :user_id, :arquivo, :folder_id)
    end
end
