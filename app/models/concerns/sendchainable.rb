module Sendchainable
  extend ActiveSupport::Concern

  included do
    class << self
      def send_chain(methods)
        methods.inject(self) do |relation, method|
          relation.send method[:name], *method[:params]
        end
      end
    end
  end
end
