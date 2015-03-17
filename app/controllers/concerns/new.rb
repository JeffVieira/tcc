module New
  extend ActiveSupport::Concern

  def new
    instance_variable_set(get_variable, get_model.new)
    breadcrumb_for_actions("novo")
  end
end
