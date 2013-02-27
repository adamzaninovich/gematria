# -*- encoding : utf-8 -*-
module Gematria
  class Calculator
    
    attr_reader :text, :table
    def initialize(text, table_name=nil)
      @text = text
      if table_name.is_a? Symbol
        @table = Tables.fetch(table_name)
      else
        @table = Tables.current
      end
    end

    # Gets an array of the values for each character of text.
    #
    #   name = Gematria::English.new("Adam")
    #   name.mapped # => [1, 4, 1, 40]
    #
    # @return [Array<Number>] numerical values attributed to each character of the original text
    def mapped
      text.each_char.map { |c| lookup_char c }
    end

    # Gets the summed gematria number of text.
    #
    #   name = Gematria::English.new("Adam")
    #   name.converted # => 46
    #
    # This uses <tt>mapped</tt> internally and sums the results.
    # @return [Number] sum of the values of each character
    def converted
      mapped.inject(:+)
    end

    # Recursively reduces the <tt>converted</tt> value to a single digit mispar katan mispari style.
    #
    #   name = Gematria::English.new("Adam")
    #   name.reduced # => 1
    #
    # For example: "Adam" -> 46 -> 10 -> 1
    # @return [Number] single digit from reduction of <tt>converted</tt> value
    def reduced
      do_reduction_on converted
    end

    private
    
    def lookup_char(char)
      table.fetch(char.downcase, 0)
    end

    def do_reduction_on(number)
      if number < 10
        number
      else
        do_reduction_on number.to_s.each_char.map(&:to_i).inject(:+)
      end
    end

  end
end
