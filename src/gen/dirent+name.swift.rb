puts "import Darwin"
puts
puts "extension dirent {"
puts "  var name: String {"
puts "    var name = [CChar]()"
puts "    name.reserveCapacity(Int(d_namlen))"

256.times do |i|
puts "    if #{i} < d_namlen { name.append(d_name.#{i}) }"
end

puts "    name.append(0)"
puts
puts "    return toASCIIString(name)"
puts "  }"
puts "}"
