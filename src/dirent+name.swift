import Darwin

extension dirent {
  var name: String {
    var name = [CChar]()
    name.reserveCapacity(Int(d_namlen))
    if 0 < d_namlen { name.append(d_name.0) }
    if 1 < d_namlen { name.append(d_name.1) }
    if 2 < d_namlen { name.append(d_name.2) }
    if 3 < d_namlen { name.append(d_name.3) }
    if 4 < d_namlen { name.append(d_name.4) }
    if 5 < d_namlen { name.append(d_name.5) }
    if 6 < d_namlen { name.append(d_name.6) }
    if 7 < d_namlen { name.append(d_name.7) }
    if 8 < d_namlen { name.append(d_name.8) }
    if 9 < d_namlen { name.append(d_name.9) }
    name.append(0)

    return toASCIIString(name)
  }
}
