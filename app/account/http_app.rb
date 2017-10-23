require "roda"
require "pry"
require_relative "../../lib/entities/account/actions/create"
require_relative "./repo/adapters/pg"
require_relative "./messages/adapters/default"

@account_creator = Account::Actions::Create.new(
  repo: Account::Repo::Adapters::PG.new,
  messenger: Account::Messengers::Adapters::Default.new
)

class Account
  class HTTPApp < Roda
    plugin :json

    route do |r|
      r.is do
        r.post do
          r.body.rewind
          request_body = r.body.read

          parsed_body = JSON.parse request_body, symbolize_names: true

          account_params = parsed_body[:account]

          account = @account_creator.call account_params

          if account
            account
          else
            response.status = 422

            response.finish
          end
        end
      end
    end
  end
end
