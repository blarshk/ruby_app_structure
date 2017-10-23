require_relative "../account"
require_relative "./create/account_creation_error"

class Account
  module Actions
    class Create
      attr_accessor :repo, :messenger

      def initialize repo:, messenger:
        @repo      = repo
        @messenger = messenger
      end

      def call id:
        account = Account.new id: id

        saved_account = @repo.save account

        if saved_account
          messenger.created saved_account

          saved_account
        else
          raise AccountCreationError
        end
      end
    end
  end
end
