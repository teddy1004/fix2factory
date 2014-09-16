module Fix2factory
  class FixtureSelector
    attr_reader :test_fixtures_dir

    def initialize(options={})
      @test_fixtures_dir = options[:test_fixtures_dir] || TEST_FIXTURES
      @matching = options[:matching]
    end

    def test_fixtures
      all_fixtures = fetch_fixtures.select { |f| f =~ /test/ }
      filter(all_fixtures)
    end

    private
    def fetch_fixtures
      project_fixtures = []
      project_fixtures.concat(fetch_dir_files(self.test_fixtures_dir))
      project_fixtures
    end

    def fetch_dir_files(dir)
      if Dir[dir].empty?
        []
      else
        Dir[dir]
      end
    end

    def filter(all_fixtures)
      return all_fixtures.select { |f| f=~ @matching } if @matching
      all_fixtures
    end
  end
end
