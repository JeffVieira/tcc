module Create
  extend ActiveSupport::Concern

  def create
    object = get_model.new(self.send(self.controller_name.singularize + "_params"))

    instance_variable_set(get_variable, object)

    if instance_variable_get(get_variable).save
      flash[:notice] = "Registro criado com sucesso"
      check_how_to_redirect
    else
      breadcrumb_for_actions("novo")
      render :new
    end
  end

  def check_how_to_redirect
    if session[:current_folder_id].blank?
      redirect_to "/" + self.controller_path
    else
      redirect_to (folder_path( Folder.find(session[:current_folder_id])))
    end
  end
end
