import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // gets the quote of the day for the management category
        let request = Quote.Get(category: "management")

        request.make()
            .done { quote in
                self.label.text = "Got quote!\n\(quote.text)\n- \(quote.author)"
            }
            .catch { error in
                self.label.text = "Uh-oh, error occured:\n\(error.localizedDescription)"
            }

    }
}
