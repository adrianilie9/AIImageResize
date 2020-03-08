# AIImageResize

[![Version](https://img.shields.io/cocoapods/v/AIImageResize.svg?style=flat)](https://cocoapods.org/pods/AIImageResize)
[![License](https://img.shields.io/cocoapods/l/AIImageResize.svg?style=flat)](https://cocoapods.org/pods/AIImageResize)
[![Platform](https://img.shields.io/cocoapods/p/AIImageResize.svg?style=flat)](https://cocoapods.org/pods/AIImageResize)

AIImageResize is an extension for UIImage that adds the capability to resize by width / height and perform image cropping. It is especially useful when dealing with images that are downloaded at runtime.

## Requirements

- Swift 5.0
- iOS >= 10.0

## Usage

All units passed to any of the methods should be in points and not actual pixels. AIImageResize keeps track of the screen pixel density when performing resizing operations.

##### Resize an UIImage to a specified size

```swift
resize(toSize size: CGSize) -> UIImage?
```

##### Resize an UIImage to a specified width, while maintaing aspect ratio

```swift
resize(toWidth width: CGFloat) -> UIImage?
```

##### Resize an UIImage to a specified height, while maintaing aspect ratio

```swift
resize(toHeight height: CGFloat) -> UIImage?
```

##### Resize an UIImage to fit a specified size

```swift
resizeToFit(inSize size: CGSize) -> UIImage?
```

##### Crop the contents of an UIImage in a specified rect

```swift
crop(inRect rect: CGRect) -> UIImage?
```

## Thread safety

All methods provided by AIImageResize can be called on background threads, however updating the UI (i.e. placing the resulted image inside an UIImageView) still needs to be performed on the main thread.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

AIImageResize is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AIImageResize'
```

## License

AIImageResize is available under the MIT license. See the LICENSE file for more info.

## Author

Adrian Ilie, adrian.ilie.x64@gmail.com
