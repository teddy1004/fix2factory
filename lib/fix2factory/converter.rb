require 'fix2factory/fixture_parser'
require 'fix2factory/factory_writer'
require 'fix2factory/fixture_selector'

module Fix2factory
  class Converter
    class << self

      def parse_all!(options)
        matching_options = parse_matching_options(options)
        selector = FixtureSelector.new(matching_options)
        selector.send("test_fixtures").each do |fixture_file_name|
          parser = FixtureParser.new(fixture_file_name)
          parser.parse_fixture
          FactoryWriter.write(parser.output_buffer, Fix2factory.class_eval("TEST_TARGET_FILE"))
        end
      end

      def parse_matching_options(options)
        return {} unless options[:matching]
        {:matching => Regexp.new(options[:matching])}
      end

    end
  end
end
