class Document < ActiveRecord::Base

  permissions :add => {
    "document:checkout" => {
      :title => "CheckOut",
      :description => "A permissão de administrador sobrescreve toda as outras permissões de sistema. Esta permissão não é considerada quando é buscada permissões de um grupo."
    },
    "documento:edit" => {
      :title => "Editar",
      :description => "Permite ver e alterar (incluir e excluir) papéis de sistema dos usuários cadastrados."
    },
    "document:verssion" => {
      :title => "Versionar",
      :description => "Usuário receberá os emails quando um processo for tramitado para o grupo e a tramitação não tiver responsável(user_id)."
    },
    "document:show" => {
      :title => "Visualizar",
      :description => "Usuário receberá os emails quando um processo for tramitado para o grupo e a tramitação não tiver responsável(user_id)."
    },
    "document:validate" => {
      :title => "Validar",
      :description => "Usuário receberá os emails quando um processo for tramitado para o grupo e a tramitação não tiver responsável(user_id)."
    },
  }, :only => [nil]

  validates :name, :date_validity, :arquivo, :document_type_id, :folder_id, presence: true
  #validates :notification_period, numericality: { only_integer: true }

  has_attached_file :arquivo
  validates_attachment_content_type :arquivo,
                                    :content_type => [/^image\/(png|gif|jpeg)/, 'application/pdf']

  belongs_to :user
  belongs_to :folder
  belongs_to :document_type

  has_many :document_histories

  has_one :new_version, class_name: "Document", primary_key: "document_id"
  belongs_to :old_version, class_name: "Document", foreign_key: "document_id"

  attr_accessor :icon
  after_initialize :set_icon
  before_save :check_is_a_version

  scope :aguardando_validacao, -> { where(:status=>3) }

  def check_is_a_version
    if document_id.present?
      self.folder_id = nil
    end
  end

  def set_icon
    case arquivo_content_type
    when "application/pdf"
      self.icon = "fa-file-pdf-o"
    when /^image\/(png|gif|jpeg)/
      self.icon = "fa-file-image-o"
    else
      self.icon = "fa-file-text-o"
    end
  end

  STATUS = {
    1 => "Valido",
    2 => "CheckOut",
    3 => "Aguardando validação",
  }
end
