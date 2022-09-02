class CreateCopies < ActiveRecord::Migration[6.0]
  def change
    create_table :copies do |t|
      t.references :book, null: false, foreign_key: true
      t.string :borrower
      t.datetime :due_date

      t.timestamps
    end
  end
end
