# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_olap_session',
  :secret      => 'e29fe55ba101154e8b0c84421e8c0171159610c467f06e953d3aa158ad2a939c03a33ca974b90035183a435ec324a791387847d1d0b4c2a4e05c0701705c5967'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
