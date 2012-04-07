require 'bundler/setup'
require 'sinatra/base'

require_relative '../lib/ohm_setup'
require_relative 'models/link'

module Shawtie
  class Application < Sinatra::Base
    get '/:hash' do |hash|
      link = Link.find(hash: hash).first

      redirect link.url
    end

    post '/' do
      url = params[:url]
      Link.create(url: url)
    end
  end
end
