# Eokoe
A simple iOS users list app.

## Prerequisites

* [Carthage](https://github.com/Carthage/Carthage)
* MacOS 10.13 or higher
* Xcode 9.2 or higher

### Get the app running

Run this in your shell:

```sh
git clone https://github.com/jaikme/eokoe.git
cd eokoe.git
carthage update --platform iOS
open EoKoe.xcodeproj
```

### Tech Stack

- [Moya](https://github.com/Moya/Moya): Network abstraction layer written in Swift
- [Quick](https://github.com/Quick/Quick): BDD framework for Swift
- [Nimble](https://github.com/Quick/Nimble): A Matcher Framework for Swift and Objective-C

## Tests

To run the tests you should do:
* open the Xcode Project "EoKoe.xcodeproj"
* select the "EoKoe" iOS scheme
* Test by select "Product" > "Test" at menu or by pressing [Cmd + U]

## License

Apache 2.0 license. See the [`LICENSE`](LICENSE) file for details.
