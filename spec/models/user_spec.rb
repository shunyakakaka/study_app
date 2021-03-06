require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.create(:record)
  end

  it do
    expect(@record).to eq @record
  end

end