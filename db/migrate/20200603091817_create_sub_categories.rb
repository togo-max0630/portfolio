# frozen_string_literal: true

class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
