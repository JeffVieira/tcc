class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])

    @users = @q.result(distinct: true).order(:id).paginate(:page => params[:page])
  end

  def dashboard

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
