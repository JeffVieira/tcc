class HomepagesController < ApplicationController

  layout "home"

  def index
    @folders = Folder.roots
  end
end
