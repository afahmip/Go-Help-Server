class CreateHelpers < ActiveRecord::Migration[5.2]
  def change
    create_table :helpers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_number
      t.references :helper_type, foreign_key: true

      t.timestamps
    end
  end
end
