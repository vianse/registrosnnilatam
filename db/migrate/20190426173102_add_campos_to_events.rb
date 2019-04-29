class AddCamposToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :headOne, :string
    add_column :events, :bodyOne, :string
    add_column :events, :headTwo, :string
    add_column :events, :bodyTwo, :string
  end
end
