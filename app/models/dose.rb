class Dose < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
end
