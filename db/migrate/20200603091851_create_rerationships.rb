class CreateRerationships < ActiveRecord::Migration[5.2]
  def change
    create_table :rerationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps

      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
