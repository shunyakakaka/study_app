require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#new" do 
    before do 
      get :new
    end
    #getのリクエスト結果がresponseという変数に格納される
    it "正常なレスポンスを返す" do
      expect(response).to be_success
    end
  end
end
