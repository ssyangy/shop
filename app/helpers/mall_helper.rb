#encoding:utf-8
module MallHelper
	def cat_title(p_cat)
		r = ""
		r << "<em>#{p_cat.name}：</em>" if p_cat
		params[:p2].blank? ? r << "<strong>全部</strong>" : r << link_to( "全部", root_path(:p1 => params[:p1]))
		return raw(r)
	end

	def c_cat_title(c_cat)
		raw(params[:p2] == "#{c_cat.id}" ? "<strong>#{c_cat.name}</strong>" : link_to(c_cat.name, root_path(:p1 => c_cat.parent.id,:p2 => c_cat.id)))
	end
end
