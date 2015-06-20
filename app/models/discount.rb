class Discount < ActiveRecord::Base
  belongs_to :type
  belongs_to :variety
  belongs_to :product

  validates_presence_of :name
  validates_presence_of :date_start
  validates_presence_of :date_end
  validates_presence_of :amount
  validates_presence_of :discount
  validates_presence_of :percent
  validates_presence_of :specification

  validates_presence_of :type_id


end
