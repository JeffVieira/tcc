class HomepagesController < ApplicationController

  #layout "adminlte"

  def index
    @user = User.new
  end
end
