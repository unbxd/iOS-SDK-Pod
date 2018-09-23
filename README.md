# iOS-SDK-Pod(PodSpec Repository)

This is a Podspec repo for 'Unbxd' iOS SDK CocoaPod. Podspec consists of details such as source url, version, external dependencies, deployment target, swift version and framework file name.

Git Repo Url: https://github.com/unbxd/iOS-SDK-Pod.git

This repository is private hence requires permission to access or update.

Podspec refers to another Git repo where the actual .framework file is hosted.

**Versioning**

Every update to podspec is tagged with version number and same version number would be updated in podspec file. This version points to same version of .framework in the source repository.

Eg: 

Pod::Spec.new do |s|

  s.name         = "Unbxd"
  s.version      = **"1.0.7"**

**Pushing update**

Everytime framework is updated and it is tagged with version number, the podspec file version field should be updated and tagged with same version number.

Eg: Considering .framework is tagged with version **1.0.8**

​	**Step 1:** Update the version field in Podspec file.

​			Pod::Spec.new do |s|

  				s.name         = "Unbxd"
  				s.version      = **"1.0.8"**

​	**Step 2:** Push the changes to remote

​			git add .

​			git commit -m "*commit message*"

​			git tag 1.0.8

​			git push origin --tags

​			pod repo push Unbxd Unbxd.podspec