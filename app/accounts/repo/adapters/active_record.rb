require "active_record"
require_relative "../interface"

class Accounts
  module Repo
    module Adapters
      class ActiveRecord < ActiveRecord::Base
        include Accounts::Repo::Interface

        table_name "accounts"

        def find(id)
          from_active_record super(id)
        end

        private

          def from_active_record(ar_account)
            Account.new(
              id: ar_account.id,
              plan_id: ar_account.plan_id,
              partner_id: ar_account.partner_id
            )
          end
      end
    end
  end
end
