class Account
  module Actions
    class Create
      module RepoInterface
        def self.save account
          raise NotImplementedError
        end
      end
    end
  end
end
