require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do 
    #get httpリクエストの結果がresponseという変数に格納される
    before do
      get :new
    end
    it "レスポンスコードが200であること" do
      expect(response).to have_http_status("200")
    end
  end
end