class Cocktail < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true
  has_many :doses, :dependent => :destroy
  has_many :ingredients, through: :doses
end
