import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost:8090/json").responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}
