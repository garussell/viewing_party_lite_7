class User < ApplicationRecord
  has_many :users_viewing_parties
  has_many :viewing_parties, through: :users_viewing_parties

  validates :email, presence: true, uniqueness: true


  def invited_viewing_parties
    ViewingParty.joins(:users).where(users: { id: id })
  end
end
