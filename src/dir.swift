import Darwin

private typealias DirPtr = UnsafeMutablePointer<DIR>

final class Dir: Printable {
  init?(_ name: String) {
    ptr = opendir(name)
    if ptr == nil { return nil }
  }

  lazy var entries: [dirent] = {
    let entries = GeneratorOf { readdir(self.ptr) }
    return Array(entries)
  }()

  var description: String {
    return join("\n", lazy(entries).map { $0.name })
  }

  deinit {
    if ptr != nil { closedir(ptr) }
  }

  private let ptr: DirPtr
}

private func opendir(name: String) -> DirPtr? {
  let ptr = Darwin.opendir(name)

  return (ptr == nil ? nil : ptr)
}

private func readdir(dir: DirPtr) -> dirent? {
  let entry = Darwin.readdir(dir)

  return (entry == nil ? nil : entry.memory)
}
