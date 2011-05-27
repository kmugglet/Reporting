# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Reporting_session',
  :secret      => 'df9d1eb4787608edeb579bf5948c9011c8866fb77d1a3143ed3e182aa5bd24ab1d2b58dc338bcee8ad3878c8bde3a964cc640c20ac0026dd287ef71c4c0d4fd1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create_spin the session table with "rake db:sessions:create_spin")
# ActionController::Base.session_store = :active_record_store
