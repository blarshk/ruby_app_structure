require "nsq_ruby"
require_relative "../interface"

class Accounts
  module Messages
    module Adapters
      class NSQ
        include Accounts::Messages::Interface

        def initialize(nsqd:, encoder:, serializer:)
          @producer = Nsq::Producer.new(nsqd: nsqd)
          @encoder = encoder
          @serializer = serializer
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
            message = @encoder.for(account)

            payload = serializer.serialize(message)

            @producer.write_to_topic("accounts.account-#{action}.v1", payload)
          end
      end
    end
  end
end