class Account
  module Actions
    class Create
      module MessengerInterface
        def self.created account
          raise NotImplementedError
        end
      end
    end
  end
end
