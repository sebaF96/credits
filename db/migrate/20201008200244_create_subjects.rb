class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :credits
      t.string :year
      t.boolean :passed
      t.integer :qualification

      t.timestamps
    end
  end
end
