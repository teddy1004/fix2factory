require 'fix2factory/fixture_parser'
require 'fix2factory/factory_writer'
require 'fix2factory/fixture_selector'

module Fix2factory

  class Converter
    class << self
      def parse_all!(options)
        matching_options = parse_matching_options(options)
        selector = FixtureSelector.new(matching_options)
        selector.test_fixtures.each do |fixture_file_name|
          parser = FixtureParser.new(fixture_file_name)
          parser.parse_fixture
          fixture_file_name.match(/(\w+)\.yml/)
          FactoryWriter.write(parser.output_buffer, "#{Fix2factory::TEST_FACTORIES}#{$1}.rb")
        end
      end

      def parse_matching_options(options)
        return {} unless options[:matching]
        {:matching => Regexp.new(options[:matching])}
      end
    end
  end

end
