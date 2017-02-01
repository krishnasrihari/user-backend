require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "responds to json formats by default" do
      get :index
      expect(response.content_type).to eq "application/vnd.api+json"
    end
  end

  describe "POST #create" do
  	context "with valid attributes" do
	  it "create a new user" do
	 	expect {
	 	  post :create,  params: { data:{ type: "users", attributes: { first_name: "fname", last_name: 'lname' }} }
	 	}.to change(User, :count).by(1)
	  end
  	end

  	context "with invalid attributes" do
  	  it "does not save a user" do
	 	expect {
	 	  post :create,  params: { data:{ type: "users", attributes: { last_name: 'lname' }} }
	 	}.to_not change(User, :count)
  	  end
  	end
  end

  describe "PATCH #update" do
  	let!(:user) { create(:user) }

  	context "with valid attributes" do
  	  it "update the user attributes" do
  	  	put :update, params: {id: user, data:{ type: "users", attributes: { first_name: "Ramu", last_name: 'Verma' }} }
  	  	user.reload
  	  	expect(user.first_name).to eq('Ramu')
  	  	expect(user.last_name).to eq('Verma')
  	  end
  	end

  	context "with invalid attributes" do
  	  it "does not update a user" do
  	  	put :update, params: {id: user, data:{ type: "users", attributes: { first_name: "Ramu", last_name: nil }} }
  	  	user.reload
  	  	expect(user.first_name).to_not eq('Ramu')
  	  end
  	end
  end
end
