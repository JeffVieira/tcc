class WorkProcessesController < ApplicationController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def work_process_params
      params.require(:work_process).permit(:name)
    end
end
