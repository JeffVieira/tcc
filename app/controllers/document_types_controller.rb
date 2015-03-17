class DocumentTypesController < ApplicationController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def document_type_params
      params.require(:document_type).permit(:name)
    end
end
