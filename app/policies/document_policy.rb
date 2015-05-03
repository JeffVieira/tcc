class DocumentPolicy < ApplicationPolicy

  def new?
    # pode criar se tiver a permissão ou se for o lider do processo
    super || @user.lider?(@record.processo)
  end
  alias_method :new, :new?

end
