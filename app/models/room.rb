class Room < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  has_many :messages
end
