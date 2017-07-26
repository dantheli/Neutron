import Foundation

public class Neutron {
    fileprivate init() {}

    public static var apiVersionFormat: (Int) -> String = { version in
        return "v\(version)"
    }
}
