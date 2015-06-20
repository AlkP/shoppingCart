class Variety < ActiveRecord::Base
  belongs_to :type
  has_many :product, dependent: :destroy
  has_many :discount, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :type_id

end

