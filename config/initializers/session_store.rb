# Be sure to restart your server when you modify this file.

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Staffsite::Application.config.session_store :active_record_store

require 'action_dispatch/middleware/session/dalli_store'
Staffsite::Application.config.session_store :dalli_store, :memcache_server => ['127.0.0.1'], :namespace => 'sessions', :key => '_staffsite_session', :expire_after => 1.hour
