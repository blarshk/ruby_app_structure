require_relative "../interface"

class Accounts
  module Messages
    module Adapters
      class Default
        include Accounts::Messages::Interface

        def created(account)
          p account
        end

        def updated(account)
          p account
        end

        def deleted(account)
          p account
        end
      end
    end
  end
end