$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
# Libraries

require 'rubygems'
require 'sinatra'
require 'warden'
require 'mongo_mapper'
require 'erb'
require 'RedCloth'
require 'bcrypt'
require 'less'
require 'mibo'
require 'authorization'
require 'account'
require 'user'
require 'post'
require 'admin'


configure :production do
  MongoMapper.database = 'mibo'
end

configure :development do
  MongoMapper.database = 'mibo'
end

configure :test do
  MongoMapper.database = 'mibo_test'
end

# TODO remove if fix is available
module ActiveSupport
  module Inflector
    # Calling String#parameterize prints a warning under Ruby 1.9,
    # even if the data in the string doesn't need transliterating.
    # Maybe Rails 3 will have fixed it...?
    undef_method :transliterate
    def transliterate(string)
      string.dup
    end
  end
end