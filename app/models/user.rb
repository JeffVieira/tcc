class User < ActiveRecord::Base
  permissions :add=>{
    "user:index" => {
      :title => "Acessar Cadastro",
      :description => "Permite cadastrar novos documentos"
    },
  } ,:only=> [:new, :edit, :destroy]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :notifications
  has_many :documents
  has_many :document_histories

  has_many :users_user_groups
  has_many :user_groups, through: :users_user_groups

  has_many :document_users
  has_many :starteds, through: :document_users, :source=>:document

  scope :can_validate_document, -> { joins(:user_groups=>:permissions).where(:'permissions.permission_code'=>"document:validate") }

  scope :aviso_vencer, -> { joins(:user_groups=>:permissions).where(:'permissions.permission_code'=>"document:aviso_vencimento") }

  def can?(permission, grupo_id=nil)
    permission = permission[0..-2] if permission.to_s.end_with?('?')
    permissions(grupo_id).include?(permission.to_s)
  end

  def permissions(grupo_id=nil)
    # Busca as permissões de um usuário com base nos papéis que ele possui
    # Salva cache de 10 minutos para evitar recalcular pemissões sem necessidade
    return user_groups.inject([]) do |arr, object| arr << object.permissions.map(&:permission_code) end.uniq.flatten
  end

  private

    def ensure_authentication_sing
      if sing.blank?
       self.sing = generate_sing
      end
    end

    def generate_sing
      loop do
        sing = OpenSSL::PKey::RSA.new 2048
        break sing unless User.where(sing: sing).first
      end
    end

end
