class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
end

#Validation
# A review must have content and a rating. The rating should be a number between 0 and 5.
# When a restaurant is destroyed, all of its reviews should be destroyed as well.
# Validate all model tests before moving to the routing layer. You can use this command:

# rspec spec/models
# to selectively run tests in the spec/models folder.

# You can also manually test your code with the rails console. Do not forget to reload! between each code change!

# rails c
# > bristol = Restaurant.new(name: "Epicure", category: "french")
# > bristol.valid?              # Should return false
# > bristol.address = "75008 Paris"
# > bristol.valid?              # Should return true
# > bristol.save                # Insert into DB and set id
# > yummy = Review.new(content: "yummy yummy", rating: 9)
# > yummy.valid? # => false
# > yummy.restaurant = bristol  # Set foreign key restaurant_id
# > yummy.save
# > bristol.reviews             # Should contain the yummy review
# > yummy.restaurant            # Should return the bristol restaurant
