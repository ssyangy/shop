#encoding:utf-8
class SessionsController < ApplicationController

	def weibo
        session[:oauth_state] = SecureRandom.hex(16)
        options = {
            client_id: 600434063,
            redirect_uri: "http://127.0.0.1:4000/auth/weibo/callback",
            state: session[:oauth_state],
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
=begin		
		if current_user.present? && current_user.authorization.blank?
			auth = current_user.authorizations.build
			auth.uid = omniauth[:uid] 
			auth.provider=omniauth[:provider] 
			auth.access_token = omniauth[:credentials][:token] 
			auth.expires_at = Time.now + omniauth[:credentials][:expires_at]
			auth.save
		elsif Authorization.where(:uid => omniauth[:uid], :provider => omniauth[:provider]).first
			session[:user_id] = Authorization.where(:uid => omniauth[:uid], :provider => omniauth[:provider]).first.user.id
		elsif current_user.blank? && Authorization.where(:uid => omniauth[:uid], :provider => omniauth[:provider]).blank?
			user = User.new
			user.true_name = omniauth[:info][:name]
			user.register_type = 3
			user.crypted_password = Digest::MD5.hexdigest('user.true_name')
			auth = user.authorizations.build 
			auth.uid = omniauth[:uid] 
			auth.provider=omniauth[:provider] 
			auth.access_token = omniauth[:credentials][:token] 
			auth.expires_at = Time.now + omniauth[:credentials][:expires_at]
			user.save && auth.save
			session[:user_id] = user.id
		end
		redirect_to root_path
=end		
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
