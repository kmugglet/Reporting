require 'fileutils'

sort_asc        = File.dirname(__FILE__) + '/../../../public/images/sort_asc.png'
sort_desc       = File.dirname(__FILE__) + '/../../../public/images/sort_desc.png'

FileUtils.cp File.dirname(__FILE__) + '/public/images/sort_asc.png',  sort_asc unless File.exist?(sort_asc)
FileUtils.cp File.dirname(__FILE__) + '/public/images/sort_desc.png', sort_desc unless File.exist?(sort_desc)

puts IO.read(File.join(File.dirname(__FILE__), 'README'))