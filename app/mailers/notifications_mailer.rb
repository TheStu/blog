class NotificationsMailer < ActionMailer::Base

  def new_message(message)
    @message = message
    mail(to: "stu@backpackingtalk.com",
         from: "User Generated Email <noreply@backpackingtalk.com>",
         subject: "[Backpackingtalk.com] #{message.subject}")
  end
end
