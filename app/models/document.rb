class Document < ActiveRecord::Base

  validates :name, :date_validity, :arquivo, presence: true
  validates :notification_period, numericality: { only_integer: true }

  has_attached_file :arquivo,
                    :url => '/:class/:id/:style.:extension',
                    :path => ':rails_root/assets/:class/:id_partition/:style.:extension'
  validates_attachment_content_type :arquivo,
                                    :content_type => [/^image\/(png|gif|jpeg)/, 'application/pdf']

  attr_accessor :icon
  after_initialize :set_icon

  def set_icon
    self.icon = "fa-file"
  end

  belongs_to :user
  belongs_to :folder
end
