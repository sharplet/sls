let args = dropFirst(Process.arguments)
let name = args.first ?? "."

if let dir = Dir(name) {
  println(dir)
} else if File.isFile(name) {
  println(name)
} else {
  fail("sls: \(name): No such file or directory")
}
