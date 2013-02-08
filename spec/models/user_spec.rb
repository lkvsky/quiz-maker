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

  context "#answered questions" do
    before do
      FactoryGirl.create(:diva, {:name => "One"})
      FactoryGirl.create(:diva, {:name => "Two"})

      FactoryGirl.create(:quiz, {:name => "quiz1"})
      FactoryGirl.create(:quiz, {:name => "quiz2"})

      FactoryGirl.create(:question, {:quiz_id => Quiz.find_by_name("quiz1").id, :question => "One"})
      FactoryGirl.create(:question, {:quiz_id => Quiz.find_by_name("quiz1").id, :question => "Two"})
      FactoryGirl.create(:question, {:quiz_id => Quiz.find_by_name("quiz1").id, :question => "Three"})
      FactoryGirl.create(:question, {:quiz_id => Quiz.find_by_name("quiz2").id, :question => "Four"})

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

    describe "#answered_questions" do
      it "returns an array of answered questions" do
        user.answered_questions.count.should eq(3)
        user.answered_questions.first.question.should eq("One")
      end
    end

    describe "#my_diva" do
      it "returns the diva id of with the highest count" do
        user.my_diva.should == 1
      end
    end

    describe "#completed_quiz?" do
      it "returns true if a user has answered all of the questions" do
        quiz = Quiz.find_by_name("quiz1")
        user.completed_quiz?(quiz).should be_true
      end

      it "returns false if a user has not answered all of the questions" do
        quiz = Quiz.find_by_name("quiz2")
        user.completed_quiz?(quiz).should be_false
      end
    end

    describe "#completed_quizzes" do
      it "returns an array of completed quizzes" do
        completed_quiz = Quiz.find_by_name("quiz1")
        user.completed_quizzes.first.should == completed_quiz
      end
    end
  end
end