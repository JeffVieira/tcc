class StatisticsController < ApplicationController

  before_action :set_index_breadcrumb

  def index
  end

  def data_grid
    add_breadcrumb "Relatório"
    @documents = Document.all
    @documents.paginate(:page=>params[:page])
  end

  def chart
    add_breadcrumb "Gráficos"

    @documents = Document.all
    @folders = Folder.all
    @document_process = DocumentProcess.all
    @users = User.all
    @user_groups = UserGroup.all
    @document_types = DocumentType.all


    @document_for_type = Document.joins(:document_type).group('document_types.name').count
  end


private

  def set_index_breadcrumb
    add_breadcrumb "Estatísticas", statistics_path
  end

end
