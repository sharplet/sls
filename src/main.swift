import Darwin

if let ptr = opendir(".") {
  while let entry = readdir(ptr) {
    let raw_name = entry.d_name

    var name = [CChar]()
    name.reserveCapacity(Int(entry.d_namlen))
    if 0 < entry.d_namlen { name.append(raw_name.0) }
    if 1 < entry.d_namlen { name.append(raw_name.1) }
    if 2 < entry.d_namlen { name.append(raw_name.2) }
    if 3 < entry.d_namlen { name.append(raw_name.3) }
    if 4 < entry.d_namlen { name.append(raw_name.4) }
    if 5 < entry.d_namlen { name.append(raw_name.5) }
    if 6 < entry.d_namlen { name.append(raw_name.6) }
    if 7 < entry.d_namlen { name.append(raw_name.7) }
    if 8 < entry.d_namlen { name.append(raw_name.8) }
    if 9 < entry.d_namlen { name.append(raw_name.9) }
    name.append(0)

    println(toASCIIString(name))
  }

  closedir(ptr)
} else {
  fail("fatal: error opening directory '.'")
}
