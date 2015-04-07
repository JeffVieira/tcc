class UserGroupsController < ApplicationController
  #before_action :set_user_group, only: [:show, :edit, :update, :destroy]
  after_filter :save_permissions, :only => [:create, :update]

  # GET /user_groups
  # GET /user_groups.json

  private
    def save_permissions
      @user_group.save_permissions(params[:permission_codes])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_group
      @user_group = UserGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_group_params
      params.require(:user_group).permit(:name, :user_ids=>[])
    end
end
