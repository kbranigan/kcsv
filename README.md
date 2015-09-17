
# Fast CSV parser written in C

## Supports:

1. Automatically figures out the field seperator using character distributions (from a list: ",|\t;")
2. Supports comments in CSV file (#)  even though this is not part of the standard
3. Automatically finds the header, even if it's after several junk lines
4. Supports line breaks in quoted strings (multiple lines)
5. Supports UTF-8, UTF-16, big/small endian, byte order mark, null fields, files with no header

It's written in C so it's probably fast, it has lots of examples

    make -f Makefile_c
    ./kcsv testdatafiles/sigh2.csv

or in Ruby:

    ruby extconf.rb
    ./test.rb testdatafiles/sigh2.csv
