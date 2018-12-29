class CreateContact < ActiveRecord::Migration[5.2]
  def up
    create_table :contacts do |t|
      t.string :name,              null: false
      t.string :phone,             null: false
      t.string :mail,              null: false
      t.text :note,                null: true
    end

    def down 
      drop_table :contacts
    end
  end
end
