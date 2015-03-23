# Json-Rpc To Rest

Middleware to make inner redirect for [Json-Rpc](http://en.wikipedia.org/wiki/JSON-RPC) requests.

## Installation

```shell
gem install json_rpc_to_rest
```

or add the following line to Gemfile:

```ruby
gem 'json_rpc_to_rest'
```

and run `bundle install` from your shell.

After that add line to `config/application.rb`

```ruby
config.middleware.use 'JsonRpcToRest'
```

Also you can specify field with method name

```ruby
config.middleware.use 'JsonRpcToRest', field: 'requestMethod'
```

Default field is `"method"` as in [specification](http://www.jsonrpc.org/specification#request_object).

## Example

```ruby
# config/application.rb
config.middleware.use 'JsonRpcToRest'
```

Post request for `/api` with params
```json
{"method": "get_posts_list", "data": [], "id": 2}
```
will be processed as `/api/get_posts_list`.

## Tests

```bash
git clone https://github.com/dzjuck/json_rpc_to_rest.git
cd json_rpc_to_rest
bundle install
rspec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
