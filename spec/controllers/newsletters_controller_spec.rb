require 'spec_helper'

describe NewslettersController do

  describe "GET 'newsletter_sign_up'" do
    it "returns http success" do
      get 'newsletter_sign_up'
      response.should be_success
    end
  end

end
