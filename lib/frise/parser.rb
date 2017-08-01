require 'yaml'

module Frise
  module Parser
    class << self
      def parse(file, symbol_table = nil)
        return {} unless File.file? file
        content = File.open(file).read
        content = Liquid::Template.parse(content).render symbol_table if symbol_table
        YAML.safe_load(content, [], [], true) || {}
      end
    end
  end
end