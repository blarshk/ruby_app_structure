require "sequel"
require_relative "../../../lib/entites/account/account"
require_relative "../../../lib/entites/account/actions/create/repo_interface"

class Account
  module Repo
    module Adapters
      class PG
        include Account::Actions::Create::RepoInterface

        def initialize database_url
          sequel_conn = Sequel.connect database_url

          @accounts_table = sequel_conn[:accounts]
        end

        def all
          @accounts_table.all
        end

        def find id
          from_row @accounts_table[id: id]
        end

        def where params
          results = @accounts_table.where params

          results.map { |a| from_row a }
        end

        def save account
          existing_account = find account.id
          row = to_row account

          if existing_account
            existing_row = @accounts_table.where id: account.id
            
            existing_row.update row
          else
            @accounts_table.insert row
          end
        end

        def delete account
          @accounts_table.where id: account.id.delete
        end

        private

          def to_row account
            {
              id: account.id
            }
          end

          def from_row row
            Account.new id: row["id"]
          end
      end
    end
  end
end