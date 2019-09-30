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
end

desc "Builds Carthage dependencies without updating, all submodules"
task :build do
    sh "cd Modules/Flow; rake cartbuild; xcodebuild -project Flow.xcodeproj clean build | xcpretty; cd ..;"
    sh "cd Modules/Ness; rake cartbuild; xcodebuild -project Ness.xcodeproj clean build | xcpretty; cd ..;"
    sh "cd Modules/Common; rake cartbuild; xcodebuild -project Common.xcodeproj build | xcpretty; cd ..;"
    sh "cd Modules/Favorites; rake cartbuild; xcodebuild -project Favorites.xcodeproj clean build | xcpretty; cd ..;"
    sh "cd Modules/MovieCatalog; rake cartbuild; xcodebuild -project MovieCatalog.xcodeproj clean build | xcpretty; cd ..;"
    sh "rake cartbuild; xcodebuild -project MovieListApp.xcodeproj clean build | xcpretty;"
end
