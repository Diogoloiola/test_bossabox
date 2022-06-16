class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.text :link
      t.string :description

      t.timestamps
    end
  end
end
