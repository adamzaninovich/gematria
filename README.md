# Gematria

A Ruby gem that calculates Gematria. This version supports English text and uses a mispar hechrachi style correspondence table, but in future versions there may be support for more languages as well as user configurable correspondence tables. The gem supports raw conversion to number (by simple summation), mapping (breakdown of individual numbers), and reduction to a single digit (mispar katan mispari).

The current correspondence table is as follows:

     a:1    b:2    c:3    d:4    e:5    f:6    g:7    h:8    i:9
     j:10   k:20   l:30   m:40   n:50   o:60   p:70   q:80   r:90
     s:100  t:200  u:300  v:400  w:500  x:600  y:700  z:800

## Installation

Add this line to your application's Gemfile:

    gem 'gematria'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gematria

## Usage

    name = Gematria::English.new("Adam")
    name.converted          # => 46
    name.mapped.join(" + ") # => "1 + 4 + 1 + 40"
    name.reduced            # => 1

    gematria = Gematria::English.new("Gematria is fun!")
    gematria.converted      # => 818
    gematria.mapped         # => [7, 5, 40, 1, 200, 90, 9, 1, 0, 9, 100, 0, 6, 300, 50, 0]

    alphabet = Gematria::English.new("abcdefghijklmnopqrstuvwxyz")
    alphabet.converted == 4095 # => true

## Contributing

Please submit specs with your feature!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 Adam Zaninovich

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.