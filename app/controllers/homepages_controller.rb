class HomepagesController < ApplicationController

  layout "home"

  def index
    @user = User.new
  end
end
