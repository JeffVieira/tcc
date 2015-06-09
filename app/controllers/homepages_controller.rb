class HomepagesController < ApplicationController

  layout "home"

  def index
    @folders = Folder.roots
    search
  end

  def search
    @documents_search = Document.search_global(params[:folder_id], params[:tag], params[:search_text])
  end
end
