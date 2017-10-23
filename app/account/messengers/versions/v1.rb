require "nsq_ruby"

class Accounts
  module Messages
    module Versions
      module V1
        extend self

        def for account
          {
            meta: {
              current_version: "v1"
            },
            id: account.id,
            type: "accounts",
            attributes: {}
          }
        end
      end
    end
  end
end
