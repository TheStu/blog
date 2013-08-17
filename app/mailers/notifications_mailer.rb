class NotificationsMailer < ActionMailer::Base
  default :from => "noreply@backpackingtalk.com"
  default :to => "stu@backpackingtalk.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Backpackingtalk.com] #{message.subject}")
  end
end
