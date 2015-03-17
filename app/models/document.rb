class Document < ActiveRecord::Base

  validates :name, :date_validity, :arquivo, presence: true

  has_attached_file :arquivo,
                    :url => '/:class/:id/:style.:extension',
                    :path => ':rails_root/assets/:class/:id_partition/:style.:extension',
                    :presence=>true
  validates_attachment_content_type :arquivo, :content_type => "application/pdf"

  attr_accessor :icon
  after_initialize :set_icon

  def set_icon
    self.icon = "fa-file"
  end

  belongs_to :user
  belongs_to :folder
end
