require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #index" do
    before do
      @user_1 = FactoryBot.create(:user)
      @user_2 = FactoryBot.create(:user, name: "テストユーザー2")
      @record_1 = FactoryBot.create(:record, user: @user_1)
      @record_2 = FactoryBot.create(:record, time: 90, user: @user_2)
      set_rank
    end

    context "レスポンスが通った時" do

    end

    context "ランキングの順番が合っているか" do
      it "@user_2が@user_1より上位であること" do
        get '/users'
        expect(@user_2.overall_ranking).to be > @user_1.overall_ranking
      end
    end
    
  end

  describe "#new" do

  end

  describe "#show" do

  end

  describe "#create" do

  end

  describe "#edit" do

  end

  describe "#update" do

  end

end
