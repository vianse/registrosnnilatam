class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :token
      t.string :urlEndPoint
      t.string :apiKey
      t.string :urlReditectionTokenEmpty
      t.string :urlRedirectionTokenError

      t.timestamps
    end
  end
end
