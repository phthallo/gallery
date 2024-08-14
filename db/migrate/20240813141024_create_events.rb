class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :website
      t.string :location
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
