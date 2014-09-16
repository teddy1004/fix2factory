require 'psych'
require 'active_support/core_ext/string'

class FileNotFoundError < IOError; end;

module Fix2factory

  class FixtureParser
    attr_reader :output_buffer, :factory_names, :factory_writer

    def initialize(fixture_file)
      raise ArgumentError if fixture_file.nil?
      raise FileNotFoundError unless File.exists?(fixture_file)
      @fixture_file = fixture_file
    end

    def model_name
      @fixture_file.match(/(\w+)\.yml/)
      $1.singularize
    end

    def parse_fixture
      @current_fixture = ::Psych.load_file(@fixture_file)
      @factory_names = @current_fixture.map { |k, v| k }
      @output_buffer = define_factories
    end

    def define_factories
      factory_defination = []

      @factory_names.each do |name|
        factory_defination << "Factory.define do"
        factory_defination << "  factory :#{model_name}, class: #{model_name.camelize} do"
        define_attributes_for(name).each do |attr|
          factory_defination << attr
        end
        
        factory_defination << "  end"
        factory_defination << "end"
        factory_defination << ""
      end

      factory_defination
    end

    def define_attributes_for(name)
      attributes = @current_fixture[name].map { |k, v| k }
      # Remove newline which treated as attributes
      attributes = attributes.select { |attr| !attr.nil? }
      attributes.map { |attr| write_factory_attribute(name, attr) }
    end

    def write_factory_attribute(name, attribute)
      attr_value = @current_fixture[name][attribute]
      # String needs quotation marks in Factory Girl
      # @fixture:
      # one:
      #   name: Teddy
      #
      # @factory
      # name 'Teddy'
      attr_value = attr_value.is_a?(Numeric) ? "#{attr_value}" : "'#{attr_value}'"
      "    #{attribute} #{attr_value}"
    end
  end

end
