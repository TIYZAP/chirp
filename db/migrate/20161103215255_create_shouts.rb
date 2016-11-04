class CreateShouts < ActiveRecord::Migration[5.0]
  def change
    create_table :shouts do |t|
      t.references :user, foreign_key: true
      t.text :body, limit: 165

      t.timestamps
    end
  end
end
