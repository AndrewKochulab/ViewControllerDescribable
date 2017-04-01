ViewControllerDescribable
=======================

[![License](https://poser.pugx.org/buonzz/laravel-4-freegeoip/license.svg)](https://packagist.org/packages/buonzz/laravel-4-freegeoip)

A simple way to switch between controllers.

Just install the pod and it is ready to use!


Requirements
============

* Swift >= 3.0
* iOS >= 8.0

Installation
============

<a href="https://cocoapods.org/pods/ViewControllerDescribable">CocoaPods</a>

    pod 'ViewControllerDescribable'
    
And after in terminal run command
    
    pod install

In your project create an enumeration like this:
```swift
extension UIStoryboard {
   enum Name: String, StoryboardNameDescribable {
       case main = "Main",
       profile = "Profile"
   }
}
```
Usage
=====

Describe your view controller like this:
```swift
import ViewControllerDescribable

extension SecondViewController: ViewControllerDescribable {
   static var storyboardName: StoryboardNameDescribable {
       return UIStoryboard.Name.profile
   }
}
```
And after push or present from view controller you have:
```swift
navigationController?.push(SecondViewController.self, configuration: { vc in
   vc.firstName = "Hello"
})

present(ThirdViewController.self)
```
Example
=======

<a href="https://github.com/AndrewKochulab/ViewControllerDescribableTest">ViewControllerDescribableTest</a>

Credits
=======

* by Andrew Kochulab
* <a href="http://vk.com/ko4ylab">VK</a>
