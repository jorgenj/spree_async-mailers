require_dependency 'spree/shipment'

module ShipmentDelayedExtension
  def self.included(base)
    base.class_eval do
      def send_shipped_email
        ShipmentMailer.delay(queue: "mail").shipped_email(self.id).deliver
      end
    end
  end
end

Spree::Shipment.send(:include, ShipmentDelayedExtension)