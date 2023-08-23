class ViewingParty < ApplicationRecord
  belongs_to :movie
  has_many :users_viewing_parties
  has_many :users, through: :users_viewing_parties
end