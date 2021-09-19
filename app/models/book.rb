class Book < ApplicationRecord
  belongs_to :topic
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships
end
