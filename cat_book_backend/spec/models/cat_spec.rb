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
  
  it "should have 10 characters in enjoys" do
    cat = Cat.create firstName: 'Buster', lastName: 'Rhymes', enjoys: 'walks', age: 4
    expect(cat.errors[:enjoys]).to_not be_empty
  end
# Update test
  it "should not update a cat without a first name" do
    cat = Cat.create firstName: 'Buster', lastName: 'Rhymes', enjoys: 'walks on the beach', age: 4
    cat.update(firstName: '')
    expect(cat.errors[:firstName]).to_not be_empty
  end

  it "should not update a cat without a last name" do
    cat = Cat.create firstName: 'Buster', lastName: 'Rhymes', enjoys: 'walks on the beach', age: 4
    cat.update(lastName: '')
    expect(cat.errors[:lastName]).to_not be_empty
  end

  it "should not update a cat without an age" do
    cat = Cat.create firstName: 'Buster', lastName: 'Rhymes', enjoys: 'walks on the beach', age: 4
    cat.update(age: '')
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should not update a cat without an enjoys" do
    cat = Cat.create firstName: 'Buster', lastName: 'Rhymes', enjoys: 'walks on the beach', age: 4
    cat.update(enjoys: '')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

end
