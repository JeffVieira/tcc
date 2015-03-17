class FoldersController < ApplicationController

  def new
    breadcrumb_for_actions("novo")
    @folder = Folder.new(parent_id: params[:folder_id])
  end

  def show
    @folder = Folder.find(params[:id])
    add_breadcrumb_to_folder
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id)
    end

    def add_breadcrumb_to_folder
      add_breadcrumb @folder.parent.name, folder_path(@folder.parent) unless @folder.parent_id.nil?
      add_breadcrumb @folder.name
    end
end
