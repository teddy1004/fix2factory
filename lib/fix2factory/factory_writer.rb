module Fix2factory

  class FactoryWriter
    class << self
      def write(output_buffer, target_file)
        File.open(target_file, 'a') do |f|
          output_buffer.each { |output| f.puts output }
        end
      end
    end
  end

end
