require "bunny"
require_relative "../interface"

class Accounts
  module Messages
    module Adapters
      class RabbitMQ
        include Accounts::Messages::Interface

        def initialize
          conn = Bunny.new
          conn.start

          @connection = conn
          @channel = @connection.create_channel
        end

        def created(account)
          publish_message("created", account)
        end

        def updated(account)
          publish_message("updated", account)
        end

        def deleted(account)
          publish_message("deleted", account)
        end

        private

          def publish_message(action, account)
            queue = @channel.create_queue("accounts.account-#{action}.v1")

            payload = JSON.dump(account)

            queue.publish(payload)
          end
      end
    end
  end
end