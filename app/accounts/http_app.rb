require "roda"
require "pry"
require_relative "./accounts"
require_relative "./repo/adapters/pg"
require_relative "./messages/adapters/default"

class Accounts
  class HTTPApp < Roda
    plugin :json

    route do |r|
      @accounts_service = Accounts.new(
        repo: Accounts::Repo::Adapters::PG.new(Config.database_url),
        messages: Accounts::Messages::Adapters::Default.new
      )

      r.is do
        r.get do
          @accounts_service.all
        end

        r.post do
          r.body.rewind
          request_body = r.body.read

          parsed_body = JSON.parse request_body, symbolize_names: true

          account_params = parsed_body[:account]

          account = @accounts_service.create account_params

          if account
            account
          else
            response.status = 422

            response.finish
          end
        end
      end

      r.is Integer do |account_id|
        @account = @accounts_service.find(account_id)

        r.get do
          if @account
            @account
          else
            response.status = 404

            response.finish
          end
        end
      end
    end
  end
end
