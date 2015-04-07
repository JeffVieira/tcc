class Checkin < ActiveRecord::Base
  belongs_to :document
  belongs_to :document_type
  belongs_to :user

  has_attached_file :arquivo
  validates_attachment_content_type :arquivo,
                                    :content_type => [/^image\/(png|gif|jpeg)/, 'application/pdf']
end
