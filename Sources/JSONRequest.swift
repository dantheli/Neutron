import Alamofire
import SwiftyJSON
import PromiseKit

/// A `JSONRequest` is a child protocol of `Request` that gives each Request a response in the form of
/// `JSON` rather than `Data`.
public protocol JSONRequest: Request {
    func process(response: JSON) throws -> ResponseType
}

public extension JSONRequest {
    public func process(response: Data) throws -> ResponseType {
        return try process(response: JSON(data: response))
    }
}
