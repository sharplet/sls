GENERATED_FILES = FileList["src/gen/*.rb"].pathmap("%{src/,}X")
SOURCE_FILE_GENERATOR = ->(n){ n.pathmap("%{,src/}p.rb") }
SOURCE_FILES = FileList["src/*.swift"] + GENERATED_FILES

require "rake/clean"

directory "gen"
CLEAN << "gen"

# e.g., "gen/foo.swift" => "src/gen/foo.swift.rb"
rule /^gen\/(.+)\.swift$/ => [SOURCE_FILE_GENERATOR, "gen"] do |t|
  sh "ruby #{t.source} > #{t.name}"
end

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
