import Darwin

typealias DirPtr = UnsafeMutablePointer<DIR>

func opendir(name: String) -> DirPtr? {
  let ptr = Darwin.opendir(name)

  return (ptr == nil ? nil : ptr)
}

func readdir(dir: DirPtr) -> dirent? {
  let entry = Darwin.readdir(dir)

  return (entry == nil ? nil : entry.memory)
}
