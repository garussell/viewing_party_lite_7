# frozen_string_literal: true

class AddMovieReferenceToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :viewing_parties, :movie, null: false, foreign_key: true
  end
end
