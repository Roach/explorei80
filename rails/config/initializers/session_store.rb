# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_explorei80_session',
  :secret      => '39fef3cf9ae62dd198a3e3967e398dab82b982bf921f1b0c491a6b2a46e77c48e6fdafd73cb841bd72a8d15861f8083edc22c61de37ac0472c42fbbfd44098c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
