class DocumentProcess < ActiveRecord::Base
  permissions :add=>{
    "document_process:index" => {
      :title => "Acessar Cadastro",
      :description => "Permite cadastrar novos documentos"
    },
  } ,:only=> [:new, :edit, :destroy]

  validates :name, presence: true

  has_many :document_types_document_process
  has_many :document_types, through: :document_types_document_process

  accepts_nested_attributes_for :document_types, allow_destroy: true
  accepts_nested_attributes_for :document_types_document_process, allow_destroy: true
end
