require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'z593T0pzx2NqVmtMwRunqQ', 
    'DROPaONpd2TbZNI0ftJ0Egja9ammTY33f6U8d3gtg'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end
