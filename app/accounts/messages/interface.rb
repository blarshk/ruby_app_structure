module Accounts
  module Messages
    module Interface
      # Publishes the state of a newly created account
      def created(account)
        raise NotImplementedError
      end

      # Publishes the state of an updated account
      def updated(account)
        raise NotImplementedError
      end

      # Publishes the state of an updated account
      def deleted(account)
        raise NotImplementedError
      end
    end
  end
end
