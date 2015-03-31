if let dir = Dir(".") {
  println(dir)
} else {
  fail("fatal: error opening directory '.'")
}
