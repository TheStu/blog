class NotificationsMailer < ActionMailer::Base
default from: "User Generated Email <noreply@backpackingtalk.com>"

  def new_message(message)
    @message = message
    mail(to: "stu@backpackingtalk.com",
         subject: "[Backpackingtalk.com] #{message.subject}")
  end
end
