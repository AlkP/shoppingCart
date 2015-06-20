class Type < ActiveRecord::Base
  has_many :variety, dependent: :destroy
  has_many :discount, dependent: :destroy

  validates_presence_of :name

end
