require "fix2factory/version"

module Fix2factory
  # Your code goes here...
  APP_ROOT = '.'

  TEST_FIXTURES = "#{APP_ROOT}/test/fixtures/*"

  TEST_FACTORY = "#{APP_ROOT}/test/factories/*"
  
  class << self
    def execute(options)
      Fix2factory::Converter.parse_all!(options)
    end
  end
end
