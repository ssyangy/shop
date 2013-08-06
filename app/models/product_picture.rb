#encoding:utf-8
class ProductPicture < ActiveRecord::Base
	belongs_to :product

	has_attached_file :avatar,
    :styles => {:large => "400x400>",:medium => "160x160>", :thumb => "75x75>",:big => "1500x1500>"},
    :url  => "/system/product:base_url/:style/:filename",
    :default_style => :big
    process_in_background :avatar

    default_scope :order => "product_pictures.position , product_pictures.id"

end
