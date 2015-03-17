class ProcessType < ActiveRecord::Base
  validates :name, presence: true
end
