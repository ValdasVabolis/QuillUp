class InquiryMailer < ApplicationMailer
  default to: "thisisvaldasvabolis@gmail.com"

  def send_inquiry(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: email, subject: 'New user inquiry from Quill')
  end
end
