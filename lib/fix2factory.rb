require "fix2factory/version"

module Fix2factory
  APP_ROOT = '.'

  TEST_FIXTURES = "#{APP_ROOT}/test/fixtures/*"

  TEST_FACTORY = "#{APP_ROOT}/test/factories/*"
  
  class << self
    def execute(options)
      puts options
      puts "hello, world"
      Fix2factory::Converter.parse_all!(options)
    end
  end
end
