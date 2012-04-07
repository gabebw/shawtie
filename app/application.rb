require 'bundler/setup'
require 'sinatra/base'

require_relative '../lib/ohm_setup'
require_relative 'models/link'

module Shawtie
  class Application < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/:hash' do |hash|
      link = Link.find(hash: hash).first

      redirect link.url
    end

    post '/' do
      url = params[:url]
      link = Link.create(url: url)
      shortened_url =  URI.join("http://#{request.host_with_port}", link.hash)
      erb :show, locals: { url: shortened_url }
    end
  end
end
