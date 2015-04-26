# Json-Rpc To Rest

Middleware to make inner redirect for [Json-Rpc](http://en.wikipedia.org/wiki/JSON-RPC) requests.

[![Gem Version](https://badge.fury.io/rb/json-rpc2rest.png)](http://badge.fury.io/rb/json-rpc2rest)
[![Build Status](https://travis-ci.org/dzjuck/json-rpc2rest.svg?branch=master)](https://travis-ci.org/dzjuck/json-rpc2rest)
[![Coverage Status](https://coveralls.io/repos/dzjuck/json-rpc2rest/badge.svg)](https://coveralls.io/r/dzjuck/json-rpc2rest)
[![Code Climate](https://codeclimate.com/github/dzjuck/json-rpc2rest/badges/gpa.svg)](https://codeclimate.com/github/dzjuck/json-rpc2rest)
[![Dependency Status](https://gemnasium.com/dzjuck/json-rpc2rest.svg)](https://gemnasium.com/dzjuck/json-rpc2rest)

## Installation

```shell
gem install json-rpc2rest
```

or add the following line to Gemfile:

```ruby
gem 'json-rpc2rest'
```

and run `bundle install` from your shell.

After that add line to `config/application.rb`

```ruby
config.middleware.use 'Json-Rpc2Rest'
```

Also you can specify field with method name

```ruby
config.middleware.use 'Json-Rpc2Rest', field: 'requestMethod'
```

Default field is `"method"` as in [specification](http://www.jsonrpc.org/specification#request_object).

## Example

```ruby
# config/application.rb
config.middleware.use 'JsonRpcToRest'
```

Post request to `/api` with params
```json
{"method": "get_posts_list", "data": [], "id": 2}
```
will be processed as `/api/get_posts_list` with same params.

## Tests

```bash
git clone https://github.com/dzjuck/json-rpc2rest.git
cd json-rpc2rest
bundle install
rspec
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
