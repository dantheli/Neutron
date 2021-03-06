import Foundation

/// The `Neutron` class provides configurable settings for requests created
/// using the `Request` protocol
public class Neutron {
    fileprivate init() {}

    public static var apiVersionFormat: (Int) -> String = { version in
        return "/v\(version)"
    }
}
