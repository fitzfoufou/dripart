class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :phone_number
      t.string  :availability
      t.text    :art_style
      t.text    :house_description

      t.timestamps
    end
  end
end
