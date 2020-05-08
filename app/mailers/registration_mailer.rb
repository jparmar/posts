class RegistrationMailer < ApplicationMailer
  class RegistrationMailer < ApplicationMailer
    default from: 'emailjparmar@gmail.com'
    CONTACT_EMAIL = 'njparmar25@gmail.com'
    def submission(message)
      @message = message
      mail(to: CONTACT_EMAIL, subject: 'New registration page submission')
    end
  end
end
