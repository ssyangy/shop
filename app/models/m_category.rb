#encoding:utf-8
class MCategory < ActiveRecord::Base
  attr_accessible :code, :name, :parent_id
  has_ancestry :cache_depth => true
  default_scope :order => "ancestry_depth ASC"

  scope :hidden, where(:is_hidden => true)
  scope :show, where(:is_hidden => false)

  def hidden
  	self.subtree.update_all(:is_hidden => true)
    Product.where(:m_category_id => self.subtree_ids).update_all(:is_selling => false)
  end

  def show
  	self.subtree.update_all(:is_hidden => false)
  end
end
