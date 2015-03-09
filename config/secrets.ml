# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure the secrets in this file are kept private
# if you're sharing your code publicly.

development:
  secret_key_base: 080b4eec73083e63919f66c6ed4685c9d5615fd30f4e632f7d6cdf7321f9dea576accf1c7113d83dc15eb6b2fd85500cd75533d0e7c4cea3bfd8e1f7f5708351

test:
  secret_key_base: 3658a6f5e2ef02e0cbe972d7763dab4afa1644469e06aca8ac5f83f36e2a8c924f674171b3cecb6e8beacf6d9d27656d3829670e7774b4ab9d8f9b15af33c970

# Do not keep production secrets in the repository,
# instead read values from the environment.
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
