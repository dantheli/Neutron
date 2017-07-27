import Neutron
import SwiftyJSON

// Example API from https://theysaidso.com/api

struct Quote {
    var id: String
    var text: String
    var author: String

    // Request that gets quote of the day.
    // `Quote.Get` becomes `GET http://quotes.rest/qod.json?category=management`

    struct Get: QuoteRequest {
        typealias ResponseType = Quote // I want to get a quote back

        let category: String? // user of this request provides

        let route: String = "/qod.json"
        var parameters: [String : Any] {

            guard let category = category else { return [:] }
            return [
                "category": category
            ]
        }

        func process(response: JSON) throws -> Quote {
            let quotes = response["contents"]["quotes"]

            guard let id = quotes["id"].string,
                let author = quotes["author"].string,
                let text = quotes["quote"].string else {
                    throw NeutronError.badResponseData
            }

            let quote = Quote(id: id, text: text, author: author)
            return quote
        }
    }
}

// Custom protocol with a default host
private protocol QuoteRequest: JSONRequest {}
extension QuoteRequest {
    var host: String {
        return "http://quotes.rest"
    }
}
