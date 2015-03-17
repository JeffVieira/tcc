class SistemConfigurationsController < ApplicationController

  def show
    breadcrumb_for_actions("Administração")
    if params[:id].blank?
      sistem_configuration = SistemConfiguration.create!
      params[:id] = sistem_configuration.id
    end
      @sistem_configuration = SistemConfiguration.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def sistem_configuration_params
      params.require(:sistem_configuration).permit(:notification_period)
    end
end
