require "rake/clean"

desc "Compile sls"
file "sls" => "src/main.swift" do |t|
  sh "xcrun -sdk macosx swiftc -o #{t.name} #{t.source}"
end
CLEAN << "sls"

task run: "sls" do |t|
  exec "./#{t.source}"
end

task default: :run
