# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Gematria::Calculator do
  it "is instantiated with text and provides access to that text" do
    gematria = Gematria::Calculator.new('mytext')
    expect(gematria.text).to eq 'mytext'
  end

  context "when no table is specified" do
    context "when a table has been set" do
      it "uses the currently selected table" do
        Gematria::Tables.set_table(:english)
        gematria = Gematria::Calculator.new('abc')
        expect(gematria.mapped).to eq [1,2,3]
      end
    end
    context "when no table has been set" do
      it "uses an empty table (all zeros)" do
        Gematria::Tables.set_table(nil)
        gematria = Gematria::Calculator.new('abc')
        expect(gematria.mapped).to eq [0,0,0]
      end
    end    
  end

  context "when English table is specified" do
    describe "#mapped" do
      it "returns an array of values for each character in text" do
        gematria = Gematria::Calculator.new('abc', :english)
        expect(gematria.mapped).to eq [1,2,3]
      end
    end

    describe "#converted" do
      it "returns the sum of the letter values" do
        gematria = Gematria::Calculator.new('abc', :english)
        expect(gematria.converted).to eq 6
      end
    end

    describe "#reduced" do
      context "when converted value is a single digit" do
        it "returns a single digit" do
          gematria = Gematria::Calculator.new('abc', :english)
          expect(gematria.reduced).to eq 6
        end
      end
      context "when converted value is more than one digit" do
        it "returns a single digit" do
          gematria = Gematria::Calculator.new('abcdefghijklmnopqrstuvwxyz', :english)
          expect(gematria.reduced).to eq 9 # 4095 -> 18 -> 9
        end
      end
    end
  end

  describe "when Hebrew table is specified" do
    before { Gematria::Tables.set_table :hebrew }

    describe "#mapped" do
      it "returns an array of values for each character in text" do
        abg = Gematria::Calculator.new('אבג')
        expect(abg.mapped).to eq [1,2,3]
      end
    end

    describe "#converted" do
      it "returns the sum of the letter values" do
        alephbet = Gematria::Calculator.new('אבגדהוזחטיכלמנסעפצקרשתךםןףץ')
        expect(alephbet.converted).to eq 4995
      end
    end

    describe "#reduced" do
      context "when converted value is a single digit" do
        it "returns a single digit" do
          abg = Gematria::Calculator.new('אבג')
          expect(abg.reduced).to eq 6
        end
      end
      context "when converted value is more than one digit" do
        it "returns a single digit" do
          alephbet = Gematria::Calculator.new('אבגדהוזחטיכלמנסעפצקרשתךםןףץ')
          expect(alephbet.reduced).to eq 9 # 4995 -> 27 -> 9
        end
      end
    end
  end

end
