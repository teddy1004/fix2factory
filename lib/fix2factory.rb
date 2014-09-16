require "fix2factory/version"
require "fix2factory/converter"

module Fix2factory

  APP_ROOT = '.'

  TEST_FIXTURES = "#{APP_ROOT}/test/fixtures/*"

  TEST_FACTORIES = "#{APP_ROOT}/test/factories/"
  
  class << self
    def execute(options)
      Fix2factory::Converter.parse_all!(options)
    end
  end

end
