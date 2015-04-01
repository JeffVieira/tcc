class DocumentTypesDocumentProcess < ActiveRecord::Base
  self.table_name = 'document_types_process'

  belongs_to :document_type
  belongs_to :document_process

  accepts_nested_attributes_for :document_type, reject_if: :all_blank, allow_destroy: true
end
