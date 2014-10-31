require 'spree_core'
require 'spree_async-mailers/engine'

module Spree
  module AsyncMailers
    # Defines the queue in which the background job will be enqueued. Default is :mailer.
    mattr_accessor :queue
    @@queue = :mailer

    # Allow configuring Spree::AsyncMailers with a block
    #
    # Example:
    #
    #     Spree::AsyncMailers.setup do |config|
    #       config.queue   = :my_custom_queue
    #     end
    def self.setup
      yield self
    end
  end
end
