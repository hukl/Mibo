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

# Configure MongoMapper

MongoMapper.database = 'mibo'
