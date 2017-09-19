require_relative "./account"

class Accounts
  attr_accessor :repo, :messages

  def initialize(repo:, messages:)
    self.repo = repo
    self.messages = messages
  end

  def all
    repo.all
  end

  def find(account_id)
    repo.find(account_id)
  end

  def create(params)
    account = Account.new params
    persisted_account = repo.save(account)

    if persisted_account
      messages.created(persisted_account)

      persisted_account
    else
      raise Accounts::CreationError
    end
  end
end
