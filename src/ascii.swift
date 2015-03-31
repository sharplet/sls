func toASCIIString(var cstring: [CChar]) -> String {
  let chars = lazy(cstring).map { Character(UnicodeScalar(UInt8($0))) }

  return String(chars)
}
