#encoding:utf-8
class SessionsController < ApplicationController

	def weibo
        session['omniauth.state'] = SecureRandom.hex(16)
        options = {
            client_id: 600434063,
            redirect_uri: "http://127.0.0.1:4000/auth/weibo/callback",
            state: session['omniauth.state']
        }
        authorize_url = "https://api.weibo.com/oauth2/authorize?#{options.map{|k, v|"#{CGI::escape(k.to_s)}=#{CGI::escape(v.to_s)}"}.join('&')}"

        redirect_to authorize_url if authorize_url
	end

	def auth
		omniauth = request.env['omniauth.auth']
		@weibo = OpenApiUser.where(:open_user_no => omniauth[:uid], :open_api_type => 3).first
		@user = @weibo.try(:user)
		if @user  #有用户，说明微博帐号已绑定客户帐号，直接登录
			session[:user_id] = @user.id
			redirect_to root_path
		elsif @weibo && !@user #有微博信息，无用户信息，第一次登录绑定已有帐号或注册新的帐号
			@user = User.new
		else #无微博信息和用户信息，先存微博记录，再绑定用户
			@weibo = OpenApiUser.new
			@weibo.open_user_no = omniauth[:uid]
			@weibo.open_api_type = 3
			@weibo.token = omniauth[:credentials][:token] 
			@weibo.save
			@user = User.new
		end
	end

	def unauth
		session[:user_id] = nil
    	#@weibo = OpenApiUser.where(:open_api_type => params[:type],:user_id => params[:user_id]).first
    	#@weibo.user_id = nil
    	#@weibo.save
    	flash[:notice] = "已接触绑定"
    	redirect_to root_path
	end
end
