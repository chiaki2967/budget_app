class CreateFinances < ActiveRecord::Migration[8.1]
  def change
    create_table :finances do |t|
      t.integer :amount
      t.string  :kind
      t.date    :date

      t.timestamps
    end
  end
end
