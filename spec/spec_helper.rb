$LOAD_PATH << File.dirname(__FILE__)

require 'bundler/setup'
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'turnip/capybara'

require_relative '../app/application'

Dir['spec/support/**/*.rb'].each { |f| require File.expand_path(f) }
