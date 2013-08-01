#encoding:utf-8
class Product < ActiveRecord::Base
  attr_accessible :barcode, :description, :is_selling, :m_category_id, :name, :remark, :price
  belongs_to :m_category
  has_many :supplier_wares
  has_many :suppliers, :through => :supplier_wares
  validates_numericality_of :price, :greater_than => 0
  validates_presence_of :name, :price, :m_category_id

  scope :selling, where(:is_selling => true)
  scope :un_selling, where(:is_selling => false)
  scope :is_un_selling, lambda{|arr| if arr.to_i==0; un_selling; elsif arr.to_i==1; selling; end; }

  def selling!
  	self.is_selling = true
  	self.save!
  end

  def un_sale!
  	self.is_selling = false
  	self.save!
  end
end
