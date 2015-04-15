class CreatePinAttachments < ActiveRecord::Migration
  def change
    create_table :pin_attachments do |t|
      t.integer :pin_id
      t.string :pictures

      t.timestamps null: false
    end
  end
end
