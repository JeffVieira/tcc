class User < ActiveRecord::Base
  permissions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :documents
  has_many :document_histories

  has_many :users_user_groups
  has_many :user_groups, through: :users_user_groups

  def can?(permission, grupo_id=nil)
    permission = permission[0..-2] if permission.to_s.end_with?('?')
    permissions(grupo_id).include?(permission.to_s)
  end

  def permissions(grupo_id=nil)
    # Busca as permissões de um usuário com base nos papéis que ele possui
    # Salva cache de 10 minutos para evitar recalcular pemissões sem necessidade
    return user_groups.inject([]) do |arr, object| arr << object.permissions.map(&:permission_code) end.uniq.flatten
  end

end
