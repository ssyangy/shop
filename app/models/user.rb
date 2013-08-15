#encoding:utf-8
class User < ActiveRecord::Base
	has_one :cart
	has_many :open_api_users
	has_one :weibo, :class_name => "OpenApiUser", :conditions => "open_api_users.open_api_type = 3"
end
