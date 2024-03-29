class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, foreign_key: true, default: nil
      t.references :comm, foreign_key: true, default: nil
      t.references :reply, foreign_key: true, default: nil
        
      t.timestamps
    end
  end
end
