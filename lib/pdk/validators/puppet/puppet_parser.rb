require 'pdk'
require 'pdk/cli/exec'
require 'pdk/validators/base_validator'

module PDK
  module Validate
    class PuppetParser < BaseValidator
      def self.name
        'puppet-parser'
      end

      def self.cmd
        'pwd'
      end
    end
  end
end
