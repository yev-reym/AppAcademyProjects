require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "uniqueness of names and session_token" do 
    before(:each) do 
      create(:user)
    end

    it { should validate_uniqueness_of(:name)}
    it { should validate_uniqueness_of(:session_token)}
  end

  describe "#is_password?" do
    let!(:user) {create(:user)}
    
    context "if given password is valid" do 
      it "should return true" do 
        expect(user.is_password?("spiritbomb")).to be(true)
      end
    end
 

    context "if given password is invalid" do 
      it "should return false" do 
        expect(user.is_password?("kamehameha")).to be(false)
      end
    end
  end

  describe "::find_by_credentials" do 
    let!(:user) {create(:user)}

    context "if given name and password link to user in db" do 
      it "should return the instance of that user" do
        expect(User.find_by_credentials(user.name, "spiritbomb")).to eq(user)
      end
    end

    context "if given name and passowrd do not link to user in db" do
      it "should return nil" do 
        expect(User.find_by_credentials(user.name, "kamehammeha")).to eq(nil)
      end
    end
  end

  describe "#reset_session_token!" do 
    let!(:user) {create(:user)}

    it "should ensure that the new session_token is not equal to the previous token" do 
      old_token = user.session_token
      expect(user.reset_session_token!).to_not be(old_token)
    end

    it "should return the new session_token of the user saved into the db" do 
      expect(user.reset_session_token!).to eq(user.session_token)
    end

  end

  describe "#password=" do 
    let!(:user) {create(:user)}

    it "should ensure that the password_digest is not equal to the password" do
      user.password=('spiritbomb')
      expect(user.password_digest).to_not be('spiritbomb') 
    end
  end

end
