class DocumentType < ActiveRecord::Base
  permissions :add=>{
    "document_type:index" => {
      :title => "Acessar Cadastro",
      :description => "Permite cadastrar novos documentos"
    },
  } ,:only=> [:new, :edit, :destroy]


  validates :name, presence: true, uniqueness: true

  has_many :documents
  has_many :document_types_document_process
  has_many :document_process, through: :document_types_document_process
end
