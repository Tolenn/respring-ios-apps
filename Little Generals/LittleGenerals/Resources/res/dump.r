$LOAD_PATH << "#{File.dirname(__FILE__)}/../lib"
require 'ttfunk'

file = TTFunk::File.open("sing.ttf")
cmap = file.cmap

chars = {}
unicode_chars = []

cmap.tables.each do |subtable|
  next if !subtable.unicode?
  chars = chars.merge( subtable.code_map )
end

unicode_chars = chars.keys.map{ |dec| dec.to_s(16) }

puts "\n -- Found #{unicode_chars.length} characters in this font \n\n"
p unicode_chars