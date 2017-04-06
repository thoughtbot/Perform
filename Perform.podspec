Pod::Spec.new do |s|
  s.name = "Perform"
  s.version = %x(git describe --tags --abbrev=0).chomp
  s.summary = "Easy dependency injection for storyboard segues."

  s.homepage = "https://github.com/thoughtbot/Perform"
  s.license = { type: "MIT", file: "LICENSE" }
  s.author = "Adam Sharp"
  s.source = { git: "https://github.com/thoughtbot/Perform.git", tag: s.version.to_s }

  s.ios.deployment_target = "8.0"

  s.source_files = "Sources/Perform/**/*.swift"

  s.dependency "Aspects", "~> 1.4"
end
