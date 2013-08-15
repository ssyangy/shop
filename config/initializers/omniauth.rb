Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, '600434063', 'd7a9832f8e3b358f0612a8bf0893ae20'
end
