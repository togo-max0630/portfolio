# frozen_string_literal: true

class AddNumcountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :likes_count, :integer
  end
end
