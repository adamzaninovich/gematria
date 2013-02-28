# -*- encoding : utf-8 -*-
module Gematria
  # Manages a set of tables that can be used to do the gematria conversion
  class TableManager

    attr_reader :tables

    def initialize
      @tables = {}
      @current = nil
    end

    # Sets the current table
    # @example
    #   Gematria::Tables.set_table(:english)
    # @param table_name [Symbol] table name
    # @return [Symbol] table name
    def set_table(table_name)
      @current = table_name
    end

    # Gets the currently selected table
    # @example After setting the table to <tt>:english</tt> with the <tt>#set_table</tt> method
    #   Gematria::Tables.current # => {'a'=>1,'b'=>2,...}
    # @return [Hash{String => Number}]
    def current
      fetch(@current)
    end

    # Adds a table to the table store. A valid table must be a Hash with single character string keys and numerical values. 
    # A table that is not a Hash will raise a TypeError. The table name will be converted to a Symbol.
    # @example
    #   Gematria::Tables.add_table :mini_english, 'a' => 1, 'b' => 2, 'c' => 3
    # @raise [TypeError] if table is not a valid Hash
    # @param name [#to_sym] table name
    # @param table [Hash{String => Number}] table of characters pointing to corresponding values
    # @return [void]
    def add_table(name, table)
      if table.is_a? Hash
        tables[name.to_sym] = table
      else
        raise TypeError, 'Invalid table format' 
      end     
    end

    # Fetches specified table
    # @example
    #   Gematria::Tables.fetch(:mini_english) # => {'a'=>1,'b'=>2,'c'=>3}
    # @param key [Symbol] table name as a Symbol
    # @return [Hash{String => Number}]
    def fetch(key)
      tables.fetch(key, {})
    end
    alias :[] :fetch

  end
end
