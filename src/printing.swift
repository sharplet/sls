import Darwin

func errorPrintln(message: String) {
  fputs("\(message)\n", stderr)
}

@noreturn
func fail(message: String, status: Int32 = 1) {
  errorPrintln(message)
  exit(status)
}

func logln(message: String) {
  errorPrintln(message)
}
