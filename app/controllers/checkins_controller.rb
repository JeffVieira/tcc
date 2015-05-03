class CheckinsController < ApplicationController
  def new
    breadcrumb_for_actions("CheckIn")
    @version = Document.find(params[:document_id])
    @document = Checkin.new(document_id: @version.id,
                            name: @version.name,
                            date_validity: @version.date_validity,
                            notification_period: @version.notification_period,
                            user_id: current_user.id,
                            document_type_id: @version.document_type_id,
                            folder_id: @version.folder_id,
                            tag: @version.tag)
  end

  def create
    @document = Checkin.new(checkin_params)
    @version = Document.find(params[:checkin][:document_id])

    if @document.save
      @version.update_attributes(status: 3)
      DocumentHistory.create(document_id: @version.id, user_id: current_user.id, action: "CheckIn")
      #DocumentNotification.document_validate_email(User.can_validate_document, @document).deliver_now

      flash[:notice] = "CheckIn criado com sucesso"

      redirect_to document_path(@version)
    else
      breadcrumb_for_actions("checkIn")

      render :new
    end
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def checkin_params
    params.require(:checkin).permit(:name, :date_validity, :checkout, :notification_period, :user_id, :arquivo, :folder_id, :document_type_id, :document_id, :status, :tag)
  end

end
