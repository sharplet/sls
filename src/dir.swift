import Darwin

typealias DirPtr = UnsafeMutablePointer<DIR>

func opendir(name: String) -> DirPtr? {
  let ptr = Darwin.opendir(name)

  return (ptr == nil ? nil : ptr)
}
