require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.create(:record)
  end

  it do
    expect(@record).to eq @record
  end
end