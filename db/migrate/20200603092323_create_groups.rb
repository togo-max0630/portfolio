# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
