class WorkProcess < ActiveRecord::Base
  belongs_to :folder
  validates :name, presence: true, uniqueness: true

  attr_accessor :icon
  after_initialize :set_icon

  def set_icon
    self.icon = "fa-paste"
  end

end
