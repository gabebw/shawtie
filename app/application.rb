require 'bundler/setup'
require 'sinatra/base'

require_relative '../lib/encoder'
require_relative '../lib/decoder'
require_relative '../lib/ohm_setup'
require_relative 'models/link'

module Shawtie
  class Application < Sinatra::Base
    get '/:hash' do |hash|
      link = Link.find(hash: hash).first

      redirect link.url
    end
  end
end
