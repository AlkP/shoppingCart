class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string  :name
      t.date    :date_start
      t.date    :date_end
      t.integer :amount     # От скольки товаров начинается скидка
      t.float   :discount   # Размер скидки
      t.integer :percent       # Тип скидки: 0 - рубли, 1 - %
      t.integer :specification # На что предоставляется скидка: 0 - данная позиция, 1 - весь чек

      t.references  :variety, index: true
      t.references  :type, index: true
      t.references  :product, index: true

      t.timestamps null: false
    end
  end
end
