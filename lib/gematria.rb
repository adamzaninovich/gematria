# -*- encoding : utf-8 -*-
require "gematria/version"
require "gematria/tables"
require "gematria/calculator"

module Gematria
	# Add built-in tables

	# applies "mispar hechrachi" method to English alphabet (http://www.inner.org/gematria/fourways.php)
	Tables.add_table :english, {
		'a' => 1,		'b' => 2,		'c' => 3,		'd' => 4,		'e' => 5,		'f' => 6,		'g' => 7,		'h' => 8,		'i' => 9,
		'j' => 10,	'k' => 20,	'l' => 30,	'm' => 40,	'n' => 50,	'o' => 60,	'p' => 70,	'q' => 80,	'r' => 90,
		's' => 100,	't' => 200,	'u' => 300,	'v' => 400,	'w' => 500,	'x' => 600,	'y' => 700,	'z' => 800
	}

	# Mispar gadol table
	Tables.add_table :hebrew, {
		'א'	=> 1,		'ב'	=> 2,		'ג'	=> 3,		'ד'	=> 4,		'ה'	=> 5,		'ו'	=> 6,		'ז'	=> 7,		'ח'	=> 8,		'ט'	=> 9,
		'י'	=> 10,	'כ'	=> 20,	'ל'	=> 30,	'מ'	=> 40,	'נ'	=> 50,	'ס'	=> 60,	'ע'	=> 70,	'פ'	=> 80,	'צ'	=> 90,
		'ק'	=> 100,	'ר'	=> 200,	'ש'	=> 300,	'ת'	=> 400,	'ך'	=> 500,	'ם'	=> 600,	'ן'	=> 700,	'ף'	=> 800,	'ץ'	=> 900
	}
end
