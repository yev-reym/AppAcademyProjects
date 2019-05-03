require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET #new' do 
        it "brings up a form to create a new user" do 
           get :new
           expect(response).to render_template(:new) 
        end
    end

    describe 'POST #create' do 
        let(:valid_params) {{user: {name:"Cell", password:"reallysucks"}}}
        let(:invalid_params) {{user: {bad_parameter: "Nope"}}}

        context "with valid parameters" do 
            it "passes user params from #new to create new user" do 
                post :create, params: valid_params
                expect(User.last.name).to eq("Cell")
            end

            it "redirects user to the show page" do 
                post :create, params: valid_params
                expect(response).to redirect_to(user_url(User.all.last.id))
            end
        end

        context "with invalid parameters" do 

            before(:each) do 
                post :create, params: invalid_params
            end

            it "adds errors to the flash errors cookie" do 
                expect(flash[:errors]).to be_present
            end

            it "stays on the new page with an error shown" do 
                expect(response).to have_http_status(200)
                expect(response).to render_template(:new)
            end
        end
    end


    describe 'GET #show' do 
        let!(:user) {create(:user)}
        it "it goes to a show view that displays user's information" do 
            get :show, params: {id: user.id}
            expect(response).to render_template(:show) 
        end
    end
end
