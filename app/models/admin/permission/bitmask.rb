# frozen_string_literal: true

module Admin
  module Permission
    class Bitmask
      def self.new(all_actions, allowed_actions)
        actions = all_actions.each_with_object({}).with_index(0) { |(action, hash), i| hash[action.to_sym] = 2**i }
        if allowed_actions.is_a?(Array)
          allowed_actions = allowed_actions.each_with_object({}) { |action, hash| hash[action.to_sym] = true }
          ::Bitmask.new(actions, allowed_actions).to_i
        else
          ::Bitmask.new(actions, allowed_actions).to_h.select { |action, value| action if value == true }.keys
        end
      end
    end
  end
end
