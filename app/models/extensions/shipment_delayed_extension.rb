require_dependency 'spree/shipment'

module ShipmentDelayedExtension
  def self.included(base)
    base.class_eval do
      def send_shipped_email
        Spree::ShipmentMailer.delay(queue: Spree::AsyncMailers.queue).shipped_email(self.id)
      end
    end
  end
end

Spree::Shipment.send(:include, ShipmentDelayedExtension)