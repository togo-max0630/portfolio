class CreateRerationships < ActiveRecord::Migration[5.2]
  def change
    create_table :rerationships do |t|

      t.timestamps
    end
  end
end
