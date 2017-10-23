require "active_record"
require_relative "../../../lib/entites/account/account"
require_relative "../../../lib/entites/account/actions/create/repo_interface"

class Account
  module Repo
    module Adapters
      class ActiveRecord < ActiveRecord::Base
        include Account::Actions::Create::RepoInterface

        table_name "accounts"

        def save account
          saved_account = super id: account.id

          from_active_record saved_account
        end

        private

          def from_active_record ar_account
            Account.new id: ar_account.id
          end
      end
    end
  end
end
