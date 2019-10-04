desc "Builds Carthage dependencies without updating"
task :cartbuild do
    sh "carthage build --platform iOS --no-use-binaries"
end

desc "Updates and builds Carthage dependencies"
task :cartupdate do
    sh "carthage update --platform iOS --no-use-binaries"
end

desc "Checks for git updates in all submodules' source code. Uses merge strategy."
task :gitupdatemodules do
    sh "git submodule update --remote --merge"
    sh "git submodule foreach git pull"
    sh "git pull"
end

desc "Pushes changes in all submodules"
task :gitpushall do
    sh "git submodule foreach git push"
    sh "git push"
end