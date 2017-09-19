class Accounts
  module Repo
    module Interface
      # returns all accounts
      def all
        raise NotImplementedError
      end

      # returns single account
      # or nil
      def find(id)
        raise NotImplementedError
      end

      # returns array of accounts
      # or empty array
      def where(params)
        raise NotImplementedError
      end

      # returns saved account
      def save(account)
        raise NotImplementedError
      end

      # returns "true"
      def delete(account)
        raise NotImplementedError
      end
    end
  end
end