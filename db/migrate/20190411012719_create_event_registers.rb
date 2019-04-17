class CreateEventRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :event_registers do |t|
      t.string :firtsName
      t.string :lastName
      t.string :nickName
      t.string :email
      t.string :eventId

      t.timestamps
    end
  end
end
