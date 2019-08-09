class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.string :title
      t.string :nickname
      t.string :date
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
