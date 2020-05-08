class SendMail
  include Sidekiq::Worker
  sidekiq_options queue: 'user_mail_queue'

  def perform(user_id)
    RegistrationMailer.send_mail(user_id)
  end
end