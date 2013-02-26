module Gematria
  class English < Struct.new(:text)
    CORRESPONDENCE_TABLE = { # applies `mispar hechrachi` method to English alphabet (http://www.inner.org/gematria/fourways.php)
      a: 1,   b: 2,   c: 3,   d: 4,   e: 5,   f: 6,   g: 7,   h: 8,   i: 9,
      j: 10,  k: 20,  l: 30,  m: 40,  n: 50,  o: 60,  p: 70,  q: 80,  r: 90,
      s: 100, t: 200, u: 300, v: 400, w: 500, x: 600, y: 700, z: 800
    }

    def mapped
      text.each_char.map { |c| lookup_char c }
    end

    def converted
      mapped.inject(:+)
    end

    def reduced
      do_reduction_on converted
    end

    private
    def lookup_char(char)
      CORRESPONDENCE_TABLE.fetch(char.downcase.to_sym, 0)
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