# iOS-SDK-Pod

This repository host Unbxd iOS framework and Podspec to distribute via Cocoapods. Podspec consists of details such as path to framework file, version, external dependencies, deployment target, swift version.

This repository is private hence requires permission to access or update.

**Pushing update**

**Step 1:** Clone this repository to local folder. Folder should have Unbxd.podspec and Framework folder which includes Unbxd.framework.

**Step 2 :** First the version number which is going to be pushed is decided. 

Considering current version of framework released is 1.0.7, now the next version would be 1.0.8.

Update the podspec file with version 1.0.8.

​				Pod::Spec.new do |s|

  				s.name         = "Unbxd"
  				s.version      = **"1.0.8"**

**Step 3 :** Replace the existing Unbxd.framework with latest in the local folder.

**Step 4 :** Push both updated podspec and .framework to remote by tagging version.

​			git add .

​			git commit -m "*commit message*"

​			git tag 1.0.8

​			git push origin --tags

​			pod repo push Unbxd Unbxd.podspec