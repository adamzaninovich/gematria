# -*- encoding : utf-8 -*-
require "gematria/version"
require "gematria/table_manager"
require "gematria/calculator"
require "gematria/built_in_tables"

# A Ruby gem that calculates Gematria
module Gematria
  # initialize TableManager
  Tables = TableManager.new

  # Add built-in tables
  BUILT_IN_TABLES.each do |name, table|
    Tables.add_table name, table
  end
end
