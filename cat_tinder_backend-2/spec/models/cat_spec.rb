require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate first name" do
    cat = Cat.create
    expect(cat.errors[:firstName]).to_not be_empty
  end
  it "should validate last name" do
    cat = Cat.create
    expect(cat.errors[:lastName]).to_not be_empty
  end
  it "should validate age" do
    cat = Cat.create
    expect(cat.errors[:age]).to_not be_empty
  end
  it "should validate enjoys" do
    cat = Cat.create
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
