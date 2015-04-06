let args = dropFirst(Process.arguments)
let name = args.first ?? "."

if let dir = Dir(name) {
  println(dir)
} else {
  fail("sls: \(name): No such directory")
}
