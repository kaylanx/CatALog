# CatALog iOS App

This is an iOS app that displays information about cats using [TheCatAPI](https://thecatapi.com). The app is built using SwiftUI and follows a Test-Driven Development (TDD) approach.

## Technologies Used

The app is built using the following technologies:

* SwiftUI: SwiftUI is a modern framework for building user interfaces in Swift. It provides a declarative syntax for defining UI elements, making it easy to build complex interfaces quickly.
* Combine: Combine is a framework for reactive programming in Swift. It allows developers to easily manage asynchronous data streams and handle events.
* [TheCatAPI](https://thecatapi.com): [TheCatAPI](https://thecatapi.com) is an open-source API that provides access to a database of cat breeds, images, and more.
* Test-Driven Development: Test-Driven Development (TDD) is an approach to software development that emphasizes writing tests before writing code. This helps ensure that the code is correct and maintainable, and reduces the risk of introducing bugs.

## Installation

To use this app, you will need to have Xcode 14.2 or later installed on your Mac. You can download Xcode from the Mac App Store or from the Apple Developer website.

Once you have Xcode installed, clone or download this repository to your local machine.

You will need to visit [TheCatAPI](https://thecatapi.com) and register for a token.  Once you have a token create a file in the root of the project called `./CatALog/Config.xcconfig` 

The file's contents should be as follows

```
//
//  Config.xcconfig
//  CatALog
//
//

// Configuration settings file format documentation can be found at:
// https://help.apple.com/xcode/#/dev745c5c974

THE_CAT_API_KEY = "YOUR API KEY HERE"
```

Open the project in Xcode by double-clicking on the `CatALog.xcodeproj` file. Then, connect your iOS device to your Mac and select it as the build target. Finally, press the "Run" button in Xcode to install the app on your device.

Alternatively, you can run the app in the iOS simulator by selecting a simulator as the build target and pressing the "Run" button in Xcode.

## Usage

When you open the app, you will see a list of cats breeds with their images and names. You can tap on a breed to see more information about it, such as an image, temperament, and origin.

You can also search for cats by name or breed using the search bar at the top of the screen. The app will display a list of cats that match your search query.

## Credits

This app uses [TheCatAPI](https://thecatapi.com) to retrieve information about cats. [TheCatAPI](https://thecatapi.com) is a free, open-source API that provides access to a database of cat breeds, images, and more.

## License

This app is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
