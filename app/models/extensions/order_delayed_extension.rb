require_dependency 'spree/order'

module OrderDelayedExtension
  def self.included(base)
    base.class_eval do
      def deliver_order_confirmation_email
        OrderMailer.delay(queue: Spree::AsyncMailers.queue).confirm_email(self.id).deliver
        update_column(:confirmation_delivered, true)
      end

      def send_cancel_email
        OrderMailer.delay(queue: Spree::AsyncMailers.queue).cancel_email(self.id).deliver
      end
    end
  end
end

Spree::Order.send(:include, OrderDelayedExtension)


