SOURCE_FILES = FileList["src/*.swift"]

require "rake/clean"

desc "Compile sls"
file "sls" => SOURCE_FILES do |t|
  swiftc = %w[xcrun -sdk macosx swiftc]
  options = ["-o", t.name]

  sh(*swiftc, *options, *t.sources)
end
CLEAN << "sls"

task run: "sls" do |t|
  exec "./#{t.source}"
end

task default: :run
