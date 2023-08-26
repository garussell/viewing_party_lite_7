# frozen_string_literal: true

class ChangeDurationDataTypeInViewingParties < ActiveRecord::Migration[7.0]
  def change
    change_column :viewing_parties, :duration, :integer, using: 'EXTRACT(EPOCH FROM duration)::integer'
  end
end
