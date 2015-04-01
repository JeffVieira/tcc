class DocumentType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :documents
  has_many :document_types_document_process
  has_many :document_process, through: :document_types_document_process
end
