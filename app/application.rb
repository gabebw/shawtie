require "bundler/setup"
require "sinatra/base"

require_relative "../lib/ohm_setup"
require_relative "models/link"

module Shawtie
  class Application < Sinatra::Base
    enable :sessions
    set :session_secret, "cool"

    after do
      if request.get? && request.path !~ /css/
        clear_flash
      end
    end

    get "/" do
      erb :index
    end

    get "/application.css" do
      File.read(File.join("public", "index.html"))
    end

    get "/show/:hash" do |hash|
      @host = request.host_with_port
      @link = Link.find(hash: hash).first
      erb :show
    end

    get "/:hash" do |hash|
      link = Link.find(hash: hash).first
      if link
        redirect link.url
      else
        session[:error] = "No link found"
        redirect to("/")
      end
    end

    post "/" do
      url = params[:url]

      if url != nil && url != ""
        unless url.start_with? "http"
          url = "http://#{url}"
        end
        link = Link.create(url: url)
        shortened_url =  URI.join("http://#{request.host_with_port}", link.hash)
        redirect to("/show/#{link.hash}")
      else
        session[:error] = "You need to give a URL to shorten!"
        redirect to("/")
      end
    end

    def clear_flash
      session.delete(:error)
    end
  end
end
