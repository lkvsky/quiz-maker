require 'spec_helper'

describe User do

  subject(:user) { User.create(:name => "Kyle",
                               :email => "kyle@lucovsky.com",
                               :password => "1234", :password_confirmation => "1234") }

  describe "#authentication" do
    it "does not authenticate if password doesn't match password confirmation" do
      user.authenticate("12345").should be_false
    end

    it "authenticates if password matches password confirmation" do
      user.authenticate("1234").should eq(user)
    end
  end

  describe "#log-out" do
    it "sets user's session token to nil" do
      user.session_token = 805
      user.log_out
      user.session_token.should be_nil
    end
  end

  context "#finished quiz" do
    before do
      FactoryGirl.create(:diva, {:name => "One"})
      FactoryGirl.create(:diva, {:name => "Two"})

      FactoryGirl.create(:question, {:question => "One"})
      FactoryGirl.create(:question, {:question => "Two"})
      FactoryGirl.create(:question, {:question => "Three"})

      FactoryGirl.create(:answer, {:question_id => 1, :diva_id => 1})
      FactoryGirl.create(:answer, {:question_id => 2, :diva_id => 1})
      FactoryGirl.create(:answer, {:question_id => 3, :diva_id => 2})

      FactoryGirl.create(:user_answer, {:user_id => user.id,
                                       :question_id => 1,
                                       :answer_id => 1})
      FactoryGirl.create(:user_answer, {:user_id => user.id,
                                 :question_id => 2,
                                 :answer_id => 2})
      FactoryGirl.create(:user_answer, {:user_id => user.id,
                           :question_id => 3,
                           :answer_id => 3})
    end

    describe "#my_diva" do
      it "returns the diva id of with the highest count" do
        user.my_diva.should == 1
      end
    end
  end
end