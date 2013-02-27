# -*- encoding : utf-8 -*-
require 'spec_helper'

module Gematria

	describe Tables do
		it "has a hash to store the tables" do
			expect(Tables::TABLES).to be_a Hash
		end

		describe "#set_table" do
			it "assigns a table to @current" do
				Tables.set_table(:english)
				expect(Tables.instance_variable_get :@current).to eq :english
			end
		end

		describe "#current" do
			context "when a table has been selected" do
				it "returns the previously selected table" do
					Tables.set_table(:hebrew)
					expect(Tables.current).to eq Tables.fetch(:hebrew)
				end
			end
			context "when a table has not been selected" do
				before do
					if Tables.instance_variable_defined? :@current
						Tables.instance_variable_set :@current, nil
					end
				end
				it "returns an empty hash" do
					expect(Tables.current).to eq({})
				end
			end
		end

		describe "#add_table" do
			context "when table is valid" do
				it "adds the table to the TABLES store" do
					Tables.add_table :valid, 'a'=>1,'b'=>2
					expect(Tables::TABLES).to include valid: {'a'=>1,'b'=>2}
				end
			end
			context "when table is invalid" do
				it "raises a TypeError" do
					expect {
						Tables.add_table :invalid, [['a',1],['b',2]]
					}.to raise_error TypeError
				end
			end
		end

		describe "#fetch" do
			context "when table exists" do
				it "returns the table" do
					Tables.add_table :mytable, 'a'=>1
					expect(Tables.fetch(:mytable)).to eq 'a'=>1
				end
			end
			context "when table does not exist" do
				it "returns an empty hash" do
					expect(Tables.fetch :non_existant_table).to eq({})
				end
			end
		end

		describe "#[]" do
			it "delegates to #fetch" do
				Tables.should_receive(:fetch).with(:key)
				Tables[:key]
			end
		end

	end

end