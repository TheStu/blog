class NewslettersController < ApplicationController
  def newsletter_sign_up
    gb = Gibbon::API.new
    gb.lists.subscribe({:id => '6b3330eb35',
                        :email => {email: params[:email_address]},
                                   merge_vars: {:FNAME => params[:first_name],
                                                :LNAME => params[:last_name]}})
    redirect_to :back, notice: 'Check your inbox, if everything went right you should have something waiting there for you!'
  end
end
