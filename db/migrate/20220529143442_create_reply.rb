class CreateReply < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.string :text
      t.references :comm, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
