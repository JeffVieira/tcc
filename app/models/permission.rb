class Permission < ActiveRecord::Base
  belongs_to :user_group
end
