require 'rails_helper'

RSpec.describe Admin::BaseController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}

  before do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:authenticate_user!)
  end

  context "With Non Admint Users" do

    it "Users should not be allowed to see the admin index" do

      get :index

      expect(response).to redirect_to "/"
      expect(flash[:warning]).to eq "You can not access that page"
    end
  end
end
