require_relative "../interface"
require_relative "../../../lib/entites/account/account"
require_relative "../../../lib/entites/account/actions/create/messenger_interface"

class Account
  module Messages
    module Adapters
      class Default
        include Account::Actions::Create::MessengerInterface

        def created account
          p account
        end
      end
    end
  end
end
