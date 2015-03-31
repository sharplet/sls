import Darwin

if let ptr = opendir(".") {
  while let entry = readdir(ptr) {
    println(entry.name)
  }

  closedir(ptr)
} else {
  fail("fatal: error opening directory '.'")
}
