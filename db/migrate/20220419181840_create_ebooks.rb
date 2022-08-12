class CreateEbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :ebooks do |t|
      t.string :title

      t.timestamps
    end
  end
end
