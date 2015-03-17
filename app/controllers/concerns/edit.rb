module Edit
  extend ActiveSupport::Concern

  def edit
    object = get_object or return

    instance_variable_set(get_variable, object)
    breadcrumb_for_actions("editar")
  end
end
