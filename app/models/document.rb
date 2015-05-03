class Document < ActiveRecord::Base

  require 'origami'

  permissions :add => {
    "document:index" => {
      :title => "Acessar Cadastro",
      :description => "Permite cadastrar novos documentos"
    },
    "document:new" => {
      :title => "Criar",
      :description => "Permite cadastrar novos documentos"
    },
    "document:checkout" => {
      :title => "CheckOut",
      :description => "A permissão de administrador sobrescreve toda as outras permissões de sistema. Esta permissão não é considerada quando é buscada permissões de um grupo."
    },
    "document:edit" => {
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
    "document:aviso_vencimento" => {
      :title => "Aviso vencimento",
      :description => "Usuário receberá os emails quando um documento estiver vencido ou vencendo."
    },
  }, :only => [nil]

  acts_as_versioned :if => Proc.new { |t| t.do_version == true }

  validates :name, :date_validity, :arquivo, :document_type_id, :folder_id, presence: true

  has_attached_file :arquivo
  validates_attachment_content_type :arquivo,
                                    :content_type => [/^image\/(png|gif|jpeg)/, 'application/pdf']

  belongs_to :user
  belongs_to :folder
  belongs_to :document_type

  has_many :document_histories
  has_many :checkins
  has_many :notifications

  has_many :document_users
  has_many :owners, through: :document_users, :source=>:user

  attr_accessor :icon, :do_version
  after_initialize :set_icon
  after_create :create_history, :sign_pdf

  scope :aguardando_validacao, ->(user_id) { where(:status=>3, :user_id=>user_id) }

  scope :vencidos_and_vencendo, -> { where(Document.arel_table[:date_validity].lteq(Date.today), :status=>1) }

  scope :vencidos, -> (user_id) { where(Document.arel_table[:date_validity].lteq(Date.today), :status=>1, :user_id=>user_id) }

  scope :vencendo, lambda { |user_id|
    where("(date_validity + interval '1' day * notification_period) <= ? and status = ? and user_id = ?", Date.today, 1, user_id)
  }

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

#private
  def create_history
    DocumentHistory.create(document_id: id, user_id: user_id, action: "Criado")
  end

  def prepare_pdf(mypdf = Origami::PDF.read(arquivo.path))
    # location, contact, reason etc are optional parameters

    hash_to_be_signed = mypdf.prepare_for_sign(
      location: "TCC-FTEC GED",
      contact: "get-tcc@gmail.com",
      reason: "Demonstração assinatura digital"
    )

    #An Optional parameter :signature_size can be passed, if the signature has different size (default it is: 1111)

    #send this hash_to_be_signed to a 3rd party application to sign (output must be in PKC#7 format )

    #save the PDF for inserting signature later
    mypdf.save('assinatura_digital/prepared.pdf')
  end

  def sign_pdf
    mypdf = Origami::PDF.read("prepared.pdf")

    # the pdf should be a prepared pdf using the prepare_for_sign method
    prepare_pdf(mypdf)

    # eg signature in PKCS #7 format
    signature_base64 = "MIIEUwYJKoZIhvcNAQcCoIIERDCCBEACAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCCArgwggK0MIICHaADAgECAggSmghu6WrtzjANBgkqhkiG9w0BAQUFADBSMR8wHQYDVQQDDBZNb2JpbGVFeHByZXNzU3RhZ2luZ0NBMSIwIAYDVQQKDBlNb2JpbGUgRXhwcmVzcyBTdGFnaW5nIENBMQswCQYDVQQGEwJJTjAeFw0xMjA5MDMxMzIzNDNaFw0xNDA5MDMxMzIzNDNaMGYxEzARBgNVBAMMClZhbGltb1Rlc3QxHTAbBgNVBAsMFDg5MTA2MDEyMDYxMzcxNTk4OTFGMQ8wDQYDVQQKDAZWYWxpbW8xEjAQBgoJkiaJk/IsZAEZFgJOUjELMAkGA1UEBhMCSU4wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJ64wMdgBbuTHhuD2UZvGazKmTDehVy03/yjwH5ZEb7VoLlOUG4RXBg2M8N0i9lqCiO+GI0aKpGP6Tfi9QtmXH8Fkt6VqeWSAVZXVHiMqZGFNAUcKG2JfAUdPTqBCB72nSdn0W6yqxAe4Vj80aux23hMsPVqieNmh0rTZhA2oITfAgMBAAGjfzB9MB0GA1UdDgQWBBQYIur/PPhTKfNKPm5hGf9uEUUgFzAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFKhsCBwF5B7wwqeErPH1/46KWJ5cMA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQEFBQADgYEAJ8zHO0h99vuK+VntfCzfbfKy/6YiJmKkXiU6pFmVGgvTOTTodNTwAQoRx9csaJwOnawPM8IYU+O/ldjvCfD+wycj+AgEPq2Up9N8AbvIcw6dIjRg4b6JBFVYYl6vdnl4N353hQFjxsuDBl4yjHx/rNz7YuDOx4d5XSJwGOSQwX4xggFjMIIBXwIBATBeMFIxHzAdBgNVBAMMFk1vYmlsZUV4cHJlc3NTdGFnaW5nQ0ExIjAgBgNVBAoMGU1vYmlsZSBFeHByZXNzIFN0YWdpbmcgQ0ExCzAJBgNVBAYTAklOAggSmghu6WrtzjAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTIxMDExMTEzNzI5WjAjBgkqhkiG9w0BCQQxFgQUjHEpwYp6rT/FIVWAbbq9lq3/79IwDQYJKoZIhvcNAQEBBQAEgYAoHgDdmt1TrtZ3k8ODQyKOtHAJgYCg1/kdqocREPhz/1U2w+OUOrwhb7u/lh0F+6jhMevzg0RNG7vkJIS1jTS15Kxlv2teW2/VdGSsdF5wmqY837fB6G3IhSuUEAtSZfG7JEAoxg36TTPgeaUxpZf0ER2jRsud9dD5hm14j+5GLw=="

    # insert the signature inside the PDF

    mypdf.insert_sign(signature_base64)

    # Save the signed PDF
    build_id_folder
    mypdf.save("public/assinatura_digital/#{self.id}/#{self.arquivo_file_name}")
  end

  def build_id_folder
    dir_path = Rails.root.join("public/assinatura_digital/#{self.id}/")
    Dir.mkdir(dir_path) unless File.directory?(dir_path)
  end
end
