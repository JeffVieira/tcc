class Folder < ActiveRecord::Base
    permissions :add=>{
    "folder:index" => {
      :title => "Acessar Cadastro",
      :description => "Permite cadastrar novos documentos"
    },
  } ,:only=> [:new, :edit, :destroy]

  acts_as_tree

  has_many :documents
  has_many :folders, foreign_key: :parent_id, class_name: "Folder"
  belongs_to :folder

  validates :name, presence: true

  attr_accessor :icon
  after_initialize :set_icon

  scope :get_father, -> { where(:parent_id=>nil) }

  scope :roots, -> { where(:parent_id=>nil) }

  def set_icon
      self.icon = "fa-folder"
  end

  def get_parents
    parent_array = [self]
    parent_array.each do |parent_folder|
      parent_array.push(parent_folder.parent) unless parent_folder.nil? || parent_folder.parent_id.blank?
    end
    return parent_array.reverse.compact
  end
end
