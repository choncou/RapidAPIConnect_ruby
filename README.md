# RapidAPI Connect - Ruby Gem

This gem allows you to connect to RapidAPI blocks from any your Ruby app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rapidapi_connect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rapidapi_connect

## Configuration

Before making any calls to RapidAPI blocks you must configure your credentials:
_(Find these on [dashboard.rapidapi.com/projects](https://dashboard.rapidapi.com/projects))_

This can be set once in an app initializer and will be available throughout.

```ruby
# project_root/config/initializers/rapid_api_config.rb (For a Rails project)

require 'rapid_api'

RapidAPI.config(
  project: 'your-project-name',
  api_key: 'XXXXXXX-your-project-apikey-XXXXXXXXXX'
)
```

## Usage

Call any API from the [RapidAPI Marketplace](https://rapidapi.com/)

```ruby
# Get Top Stories from HackerNews

top_stories = RapidAPI.call('HackerNews', 'getTopStories')

# Get a specific item from HackerNews

RapidAPI.call('HackerNews', 'getItem', { 'itemId': '13126633'})
# => {
#      "executionTime"=>"2016-12-10T04:33:18.299Z", "project"=>"my-project", "block"=>"getItem",
#      "package"=>"HackerNews", "outcome"=>"success", 
#      "payload"=>{
#                   "by"=>"hollaur", "descendants"=>0, "id"=>13126633, "score"=>4, "time"=>1481147798,
#                   "title"=>"Design a Better Website: Foundation First", "type"=>"story",
#                   "url"=>"https://medium.com/@Toptal/design-a-better-website-foundation-first-541de01daaf2#.cxzvjr6wm"
#                 }
#    }

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/choncou/RapidAPIConnect_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

