# -*- encoding : utf-8 -*-
module Gematria
  module Tables
    # Stores available tables
    TABLES = {}

    # Sets the global current table
    #
    #     Tables.set_table(:english)
    #     Tables.current # => {'a'=>1,'b'=>2,...}
    #
    # @param table_name [Symbol] table name
    # @return [Symbol] table name
    def self.set_table(table_name)
      @current = table_name
    end

    # Gets the currently selected table
    #
    #     Tables.set_table(:english)
    #     Tables.current # => {'a'=>1,'b'=>2,...}
    #
    # @return [Hash{String => Number}]
    def self.current
      fetch(@current)
    end

    # Adds a table to the table store. A valid table must be a Hash with single character string keys and numerical values. 
    # A table that is not a Hash will raise a TypeError. The table name will be converted to a Symbol.
    #
    #     Tables.add_table :mini_english, 'a' => 1, 'b' => 2, 'c' => 3
    #
    # @param name [#to_sym] table name
    # @param table [Hash{String => Number}] table of characters pointing to corresponding values
    def self.add_table(name, table)
      if table.is_a? Hash
        TABLES[name.to_sym] = table
      else
        raise TypeError, 'Invalid table format' 
      end     
    end

    # Fetches specified table
    #
    #     Tables.fetch(:mini_english) # => {'a'=>1,'b'=>2,'c'=>3}
    #
    # @param key [Symbol] table name as a Symbol
    # @return [Hash{String => Number}]
    def self.fetch(key)
      TABLES.fetch(key, {})
    end

    # Fetches specified table (delegates to #fetch)
    #
    #     Tables[:mini_english] # => {'a'=>1,'b'=>2,'c'=>3}
    #
    # @param key [Symbol] table name as a Symbol
    # @return [Hash{String => Number}]
    def self.[](key)
      fetch(key)
    end

  end
end
