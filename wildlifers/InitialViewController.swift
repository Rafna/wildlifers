import UIKit

class InitialViewController : UIViewController {
    @IBOutlet weak var newDataButton: UIButton!
    @IBOutlet weak var reviewDataButton: UIButton!
    @IBOutlet weak var exportDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = RaptorNestActivity()
        
        let mirror = Mirror(reflecting:activity)
        
        for (name, value) in mirror.children {
            guard let name = name else {continue}
            print("\(name): \(type(of: value)) = '\(value)'")
        }
    }
}
