require 'spec_helper'

describe SessionsController do
  let(:user) { double("User", :name => "Ky", :email => "k@y.com", :password => "12345", :session_token => nil) }

  describe "#create" do
    let(:good_params) do
      { :user => {
          :name => "Ky", :email => "k@y.com", :password => "12345"
        }
      }
    end

    let(:bad_params) do
      { :user => {
          :name => "Ky", :email => "k@y.com", :password => "123"
        }
      }
    end

    context "authenticates user" do
      before do
        User.stub(:authenticate).with(:good_params).and_return(user)
        post :create, good_params
      end

      # it "sets the user's session token if user authenticates" do
      #   assigns(:session_token).should be_true
      # end
    end
  end
end
