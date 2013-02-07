require 'spec_helper'

describe User do

  subject(:user) { User.create(:name => "Kyle",
                               :email => "kyle@lucovsky.com") }

  describe "#log-out" do
    it "sets user's session token to nil" do
      user.session_token = 805
      user.log_out
      user.session_token.should be_nil
    end
  end
  
end