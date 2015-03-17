class Folder < ActiveRecord::Base
  acts_as_tree

  has_many :documents
  has_many :work_process
  has_many :folders, foreign_key: :parent_id, class_name: "Folder"
  belongs_to :folder#, foreign_key: :parent_id, class_name: "Folder"

  validates :name, presence: true

  attr_accessor :icon
  after_initialize :set_icon

  scope :get_father, -> { where(:parent_id=>nil) }

  def set_icon
    self.icon = "fa-folder"
  end

  def get_first_parent
    return parent if parent.parent_id.nil?
    parent.get_first_parent
  end
end
