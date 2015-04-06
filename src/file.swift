import Darwin

struct File {
  static func isFile(name: String) -> Bool {
    return Stat(name)?.isFile ?? false
  }

  struct Stat {
    init?(_ name: String) {
      stat = Darwin.stat()

      if Darwin.stat(name, &stat) == -1 {
        return nil
      }
    }

    var isFile: Bool {
      return (stat.st_mode & S_IFREG) == S_IFREG
    }

    private let stat: Darwin.stat
  }
}
