require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Gemrage::Config[:twitter][:access], Gemrage::Config[:twitter][:secret]
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end
