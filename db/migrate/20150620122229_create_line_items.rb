class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer    :amount

      t.references :product, index: true
      t.references :cart, index: true

      t.timestamps null: false
    end
  end
end
