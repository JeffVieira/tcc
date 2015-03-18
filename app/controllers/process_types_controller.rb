class ProcessTypesController < ApplicationController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def process_type_params
      params.require(:process_type).permit(:name)
    end
end
