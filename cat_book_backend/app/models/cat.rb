class Cat < ApplicationRecord
    validates :firstName, :lastName, :age, :enjoys, presence: true
    validates :enjoys, length: { minimum: 10 }
end
