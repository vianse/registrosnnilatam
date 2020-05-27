class AddBotonTextoToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :boton_texto, :string
  end
end
