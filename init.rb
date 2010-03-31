$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
# Libraries

require 'rubygems'
require 'sinatra'
require 'mongo_mapper'
require 'warden'
require 'erb'
require 'RedCloth'
require 'less'
require 'mibo'
require 'post'

# Configure MongoMapper

MongoMapper.database = 'mibo'
