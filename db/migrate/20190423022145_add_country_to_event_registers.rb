class AddCountryToEventRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :event_registers, :country, :string
  end
end
