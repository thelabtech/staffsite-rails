cas_logger = CASClient::Logger.new(::Rails.root.join('log/cas.log').to_s)
cas_logger.level = Rails.env.development? ? Logger::DEBUG : Logger::INFO

CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://signin.relaysso.org/cas",
  :encode_extra_attributes_as => :json,
  :logger => cas_logger
)

