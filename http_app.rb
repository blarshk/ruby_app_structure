require "dotenv"
Dotenv.load
require_relative "./config/config"

# Have to include singleton here so Moirai doesn't explode
require "singleton"
require "roda"
require "json"
require File.expand_path('../app/accounts/http_app',  __FILE__)

class HTTPApp < Roda
  plugin :json

  route do |r|
    r.on "accounts" do
      r.run Accounts::HTTPApp
    end
  end
end
