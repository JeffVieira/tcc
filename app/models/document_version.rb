class DocumentVersion < ActiveRecord::Base
  has_attached_file :arquivo
  validates_attachment_content_type :arquivo,
                                    :content_type => [/^image\/(png|gif|jpeg)/, 'application/pdf']
end
