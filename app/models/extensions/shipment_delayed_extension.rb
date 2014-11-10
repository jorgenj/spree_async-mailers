require_dependency 'spree/shipment'

module ShipmentDelayedExtension
  def self.included(base)
    base.class_eval do
      def send_shipped_email
        begin
          Spree::ShipmentMailer.delay(Spree::AsyncMailers.queue).shipped_email(self.id)
        rescue => err
          Rails.logger.error "Failed to enqueue delayed mailer : #{err.message} : #{err.backtrace.join('|')}"
          raise err
        end
      end
    end
  end
end

Spree::Shipment.send(:include, ShipmentDelayedExtension)