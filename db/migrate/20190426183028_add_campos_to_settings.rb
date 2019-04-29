class AddCamposToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :head, :string
    add_column :settings, :body, :string
  end
end
