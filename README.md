# Neutron
**Protocol-oriented networking in Swift with promises**

[![Version](https://img.shields.io/cocoapods/v/Neutron.svg?style=flat)](http://cocoapods.org/pods/Neutron)
[![Platform](https://img.shields.io/cocoapods/p/Neutron.svg?style=flat)](http://cocoapods.org/pods/Neutron)
[![License](https://img.shields.io/cocoapods/l/Neutron.svg?style=flat)](http://cocoapods.org/pods/Neutron)

## Introduction

Networking in Swift traditionally involves a tediously long list of static functions in a "networking" manager class, with each function doing repetitive calls to a library or other helper functions. Worst of all, information about each request is often scattered across different places (routes may be in one enum, parameter keys may be in another, etc.). With Neutron, requests are defined as *structs*, and defining and making them are effortless.

Defining a request:
```swift
struct Login: Request {
    typealias ResponseType = User
    
    let username: String, password: String
    
    let route = "/login"
    
    func process(response: Data) throws -> User {
    	let user = ...
    	return user
    }
}
```

Making (doing) the request:
```swift
Login(username: "user", password: "****")
	.make()
    .then { user in
    	print("Got user:", user)
    }
    .catch { error in
    	print(error)
    }
```

Thanks to protocols, structs, and [PromiseKit](https://github.com/mxcl/PromiseKit), it's very straightforward to define, form, and make the network request.

## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Requires Swift 3.0 or above

## Installation

Neutron is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Neutron"
```

## Todo List
- [ ] README documentation
- [ ] Testing and CI
- [ ] Swift 2.x compatability
- [ ] More Request Types
- [ ] Configuration and documentation in Neutron.swift
- [ ] Replace dependencies?

## Author

Daniel Li, dl743@cornell.edu

## License

Neutron is available under the MIT license. See the LICENSE file for more info.
