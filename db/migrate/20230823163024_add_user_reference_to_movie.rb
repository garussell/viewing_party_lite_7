# frozen_string_literal: true

class AddUserReferenceToMovie < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :user, null: false, foreign_key: true
  end
end
