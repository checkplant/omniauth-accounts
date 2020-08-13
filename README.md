# Omniauth::Accounts

Checkplant Accounts Omniauth2

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-accounts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-accounts

## Configuration

```ruby
# In Rails, you could put this in config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :accounts, accounts_CLIENT_ID, accounts_CLIENT_SECRET, {:scope => SCOPES}
end
```

## Usage

TODO: Write usage instructions here

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/robson-checkplant/omniauth-accounts.
