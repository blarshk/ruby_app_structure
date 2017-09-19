require "nsq_ruby"
require_relative "../interface"

class Accounts
  module Messages
    module Versions
      module V1
        extend self

        def for(account)
          {
            meta: {
              current_version: "v1"
            },
            id: account.id,
            type: "accounts",
            attributes: {
              plan_id: account.plan.id,
              partner_id: account.partner.id
            }
          }
        end
      end
    end
  end
end