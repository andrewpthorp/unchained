### Unchained

A ruby client library for the Camelot Unchained API.

You can view the API documentation at http://api.camelotunchained.com/

### Usage

First, install the gem:

```ruby
gem install unchained
```

Alternatively, add the gem to your Gemfile:

```ruby
gem 'unchained'
```

Once you have the gem installed, you can use it to interact with the Camelot
Unchained API:

```ruby
[1] pry(main)> client = Unchained::Client.new;
[2] pry(main)> client.servers.first
=> #<Unchained::Client::Servers::Server:0x007fa0b94c7258 @access_level=6, @channel_id=4, @host="wyrmlingprep.camelotunchained.com", @name="WyrmlingPrep", @player_maximum=1000, @shard_id=1>
```

### TODO

- Implement `loginToken` endpoints

### License

View the [License](LICENSE.md)

