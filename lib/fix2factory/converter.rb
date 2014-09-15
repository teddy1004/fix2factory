require 'fix2factory/fixture_parser'
require 'fix2factory/factory_writer'
require 'fix2factory/fixture_selector'

module Fix2factory
  class Converter
    class << self
      def parse_all!(options)
        matching_options = parse_matching_options(options)
        selector = FixtureSelector.new(matching_options)
      end
    end
  end
end
