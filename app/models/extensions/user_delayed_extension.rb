require_dependency 'spree/user'

module UserDelayedExtension
  def self.included(base)
    base.class_eval do
      devise :async
    end
  end
end

Spree::User.send(:include, UserDelayedExtension)