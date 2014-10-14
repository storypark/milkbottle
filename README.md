# Milkbottle

A ruby gem to wrap the Milkbooks API.

The structure of this project is derived from github's octokit.rb project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'milkbottle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install milkbottle

## Usage

TODO: Either configure by an initalizer:

```ruby
Milkbottle.configure do |c|
  c.api_key = 'API-KEY'
end
```

or as a standalone client:

```ruby
Milkbottle::Client.new(api_key: 'API-KEY')
```

## Contributing

1. Fork it ( https://github.com/storypark/milkbottle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
