class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :message
      t.string :urlTolink
      t.string :active
      t.string :position
      t.string :userID

      t.timestamps
    end
  end
end
