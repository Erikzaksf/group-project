ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'user'




RSpec.configure do |config|
  config.after(:each) do
    User.all().each() do |category|
      category.destroy()
    end

  end
end
