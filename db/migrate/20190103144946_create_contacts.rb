class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :category
      t.text :content
      t.string :sender_email

      t.timestamps
    end
  end
end
