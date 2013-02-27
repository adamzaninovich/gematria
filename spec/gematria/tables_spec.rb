# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Gematria::Tables do
	it "has a hash to store the tables" do
		expect(Gematria::Tables::TABLES).to be_a Hash
	end

	describe "#add_table" do
		context "when table is valid" do
			it "adds the table to the TABLES store" do
				Gematria::Tables.add_table :valid, 'a'=>1,'b'=>2
				expect(Gematria::Tables::TABLES).to include :valid=>{'a'=>1,'b'=>2}
			end
		end
		context "when table is invalid" do
			it "raises a TypeError" do
				expect {
					Gematria::Tables.add_table :invalid, [['a',1],['b',2]]
				}.to raise_error TypeError
			end
		end
	end

	describe "#fetch" do
		context "when table exists" do
			it "returns the table" do
				Gematria::Tables.add_table :mytable, 'a'=>1
				expect(Gematria::Tables.fetch(:mytable)).to eq 'a'=>1
			end
		end
		context "when table does not exist" do
			it "raises a KeyError" do
				expect {
					Gematria::Tables.fetch(:non_existant_table)
				}.to raise_error KeyError
			end
		end
	end

	describe "#[]" do
		it "delegates to #fetch" do
			Gematria::Tables.should_receive(:fetch).with(:key)
			Gematria::Tables[:key]
		end
	end

end