class UserGroup < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :permissions, :dependent => :delete_all
  accepts_nested_attributes_for :permissions

  def save_permissions(codes)
    delete_permissions(codes)
    create_permissions(codes)
  end

  private

  def delete_permissions(codes)
    # apaga as permissões que não estão na lista passada
   permissions.where("permission_code not in (?)", codes).destroy_all unless codes.nil?
  end

  def create_permissions(codes)
    # Cria as permissões que estão na lista porém não estão no banco
    return if codes.nil?
    permission_codes = permissions.map(&:permission_code)
    codes.each do |permission_code|
      permissions.create(:permission_code => permission_code) unless permission_codes.include?(permission_code)
    end
  end
end
