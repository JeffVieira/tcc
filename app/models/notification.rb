class Notification < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
  belongs_to :autor, class_name:"User", foreign_key: :autor_id

  scope :unread, -> { where(:read=>false) }

  attr_accessor :icon, :read
  after_initialize :set_icon

  def set_icon
    if read
      self.icon = "fa-check-square-o"
    else
      self.icon = "fa-square-o"
    end
  end

  def description
    read_attribute(:name)||"Vazia"
  end
end
