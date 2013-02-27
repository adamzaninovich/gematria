# -*- encoding : utf-8 -*-
module Gematria
  module Tables
    TABLES = {}

    module_function

    # Adds a table to the table store. A valid table must be a Hash with single character string keys and numerical values. 
    # A table that is not a Hash will raise a TypeError. The table name will be converted to a Symbol.
    #
    #     Tables.add_table :mini_english, 'a' => 1, 'b' => 2, 'c' => 3
    #
    # @param name [#to_sym] table name
    # @param table [Hash{String => Number}] table of characters pointing to corresponding values
    def add_table(name, table)
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
    def fetch(key)
      TABLES.fetch(key)
    end

    # (see #fetch)
    def [](key)
      fetch(key)
    end

  end
end
