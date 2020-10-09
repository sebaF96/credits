class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.belongs_to :user
      t.belongs_to :subject
      t.integer :qualification

      t.timestamps
    end
  end
end
