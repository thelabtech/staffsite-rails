Airbrake.configure do |config|
  config.api_key		= '80cd67bf23dd42a3adcd6388c6c05818'
  config.host				= 'errors.uscm.org'
  config.port				= 80
  config.secure			= config.port == 443
end
