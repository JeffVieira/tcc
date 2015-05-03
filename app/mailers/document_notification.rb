class DocumentNotification < ApplicationMailer
  default from: "jeff_malganis@hotmail.com"

  def document_validate_email(users, document)
    @user = users
    @document = document
    @url = "http://localhost:3000/documents/validar?id=#{@document.id}"
    mail(to: @user.map(&:email), subject: '[GED] Documento aguardando validação')
  end

  def document_vencimento_email(users, document)
    @user = users
    @document = document
    mail(to: @user.map(&:email), subject: '[GED] Documento esta vencido ou preste a vencer')
  end
end
