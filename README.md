# Gematria (גימטריא) [![Build Status](https://travis-ci.org/adamzaninovich/gematria.png?branch=master)](https://travis-ci.org/adamzaninovich/gematria)

A Ruby gem that calculates Gematria. The gem comes with built-in correspondence tables for English and Hebrew text, but allows for user-configurable tables. The gem supports raw conversion to number (by simple summation), mapping (breakdown of individual numbers), and reduction to a single digit (mispar katan mispari).

The included correspondence tables are as follows:

![Correspondence Tables](https://dl.dropbox.com/u/2436753/github/gematria/correspondence_tables.png)

## Documentation

Documentation at [rubydoc.info](http://rubydoc.info/github/adamzaninovich/gematria).

## Installation

Add this line to your application's Gemfile:

    gem 'gematria'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gematria

## Usage

    name = Gematria::Calculator.new "Adam", :english
    name.converted          # => 46
    name.mapped.join(" + ") # => "1 + 4 + 1 + 40"
    name.reduced            # => 1

    gematria = Gematria::Calculator.new "Gematria is fun!", :english
    gematria.converted      # => 818
    gematria.mapped         # => [7, 5, 40, 1, 200, 90, 9, 1, 0, 9, 100, 0, 6, 300, 50, 0]

Setting a global table

    Gematria::Tables.set_table :hebrew
    alephbet = Gematria::Calculator.new 'אבגדהוזחטיכלמנסעפצקרשתךםןףץ'
    alephbet.converted == 4995 # => true

Defining a custom table

    Gematria::Tables.add_table :mini, 'a' => 1, 'b' => 10, 'c' => 100
    abcd = Gematria::Calculator.new 'abcd', :mini
    abcd.mapped    # => [1,10,100,0]
    abcd.converted # => 111
    abcd.reduced   # => 3

## Issues

If you find any issues or errors with this gem, please report them on [Github Issues](http://github.com/adamzaninovich/gematria/issues).

## Contributing

Please submit documentation and specs with your feature.

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
