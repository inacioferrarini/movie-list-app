desc "Builds Carthage dependencies without updating"
task :cartbuild do
    sh "carthage build --platform iOS --no-use-binaries"
end

desc "Updates and builds Carthage dependencies"
task :cartupdate do
    sh "carthage update --platform iOS --no-use-binaries"
end

desc "Builds Carthage dependencies without updating, all submodules"
task :cartbuildall do
    sh "git submodule foreach carthage build --platform iOS --no-use-binaries"
end

desc "Updates and builds Carthage dependencies, all submodules"
task :cartupdateall do
    sh "git submodule foreach carthage update --platform iOS --no-use-binaries"
end
