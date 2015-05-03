namespace :send_aviso_vencimento do
  desc "Envia aviso aos autores do documento ou usuarios que tenham permissão de document:aviso_vencimento"
  task :document => :environment do
    Document.vencidos_and_vencendo.each do |document|
      DocumentNotification.document_vencimento_email(User.aviso_vencer, document).deliver_now
    end
  end
end
