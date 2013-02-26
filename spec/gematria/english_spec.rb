require 'spec_helper'

describe Gematria::English do
  it "is instantiated with text and provides access to that text" do
    gematria = Gematria::English.new('mytext')
    expect(gematria.text).to eq 'mytext'
  end

  describe "#mapped" do
    it "returns an array of values for each character in text" do
      gematria = Gematria::English.new('abc')
      expect(gematria.mapped).to eq [1,2,3]
    end
  end

  describe "#converted" do
    it "returns the sum of the letter values" do
      gematria = Gematria::English.new('abc')
      expect(gematria.converted).to eq 6
    end
  end

  describe "#reduced" do
    context "when converted value is a single digit" do
      it "returns a single digit" do
        gematria = Gematria::English.new('abc')
        expect(gematria.reduced).to eq 6
      end
    end
    context "when converted value is more than one digit" do
      it "returns a single digit" do
        gematria = Gematria::English.new('abcdefghijklmnopqrstuvwxyz')
        expect(gematria.reduced).to eq 9 # 4095 -> 18 -> 9
      end
    end
  end
end