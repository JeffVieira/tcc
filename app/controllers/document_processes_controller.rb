class DocumentProcessesController < ApplicationController

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def document_process_params
      params.require(:document_process).permit(:name,
        document_types_process_attributes: [:id, :_destroy, :document_type_id,
        document_type_attributes: [:id, :name, :_destroy]])
    end
end
