class Product < ActiveRecord::Base
  belongs_to :variety
  has_many :discount, dependent: :destroy
  has_many :line_item, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :variety_id

end
