import Darwin

let ptr = opendir(".")
if ptr == nil {
  fputs("fatal: error opening directory '.'", stderr)
  exit(1)
}

while true {
  let entry_ptr = readdir(ptr)
  if entry_ptr == nil { break }

  let entry = entry_ptr.memory

  let raw_name = entry.d_name

  var chars = [CChar]()
  chars.reserveCapacity(Int(entry.d_namlen))
  if 0 < entry.d_namlen { chars.append(raw_name.0) }
  if 1 < entry.d_namlen { chars.append(raw_name.1) }
  if 2 < entry.d_namlen { chars.append(raw_name.2) }
  if 3 < entry.d_namlen { chars.append(raw_name.3) }
  if 4 < entry.d_namlen { chars.append(raw_name.4) }
  if 5 < entry.d_namlen { chars.append(raw_name.5) }
  if 6 < entry.d_namlen { chars.append(raw_name.6) }
  if 7 < entry.d_namlen { chars.append(raw_name.7) }
  if 8 < entry.d_namlen { chars.append(raw_name.8) }
  if 9 < entry.d_namlen { chars.append(raw_name.9) }
  chars.append(0)

  var ascii_chars = chars.map { Character(UnicodeScalar(UInt8($0))) }

  let name = String(ascii_chars)

  println(name)
}

closedir(ptr)
