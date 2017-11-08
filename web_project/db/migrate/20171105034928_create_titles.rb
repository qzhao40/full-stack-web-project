class CreateTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :titles do |t|
      t.text :body
      t.datetime :published_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
