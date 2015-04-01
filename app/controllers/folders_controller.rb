class FoldersController < ApplicationController

  def new
    breadcrumb_for_actions("novo")
    @folder = Folder.new(parent_id: params[:folder_id])
  end

  def show
    @folder = Folder.find(params[:id])
    add_all_parent_breadcrumb(@folder)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id)
    end
end
