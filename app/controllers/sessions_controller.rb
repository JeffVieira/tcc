class SessionsController < Devise::SessionsController
  #prepend_before_filter :require_no_authentication, :only => [:create ]
  #include Devise::Controllers::InternalHelpers

  layout "default"
end
