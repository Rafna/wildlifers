import UIKit

class InitialViewController : UIViewController {
    @IBOutlet weak var newDataButton: UIButton!
    @IBOutlet weak var reviewDataButton: UIButton!
    @IBOutlet weak var exportDataButton: UIButton!

    @IBAction func enterDataTapped(_ sender: Any) {
        let interactor = DataEntryTableInteractor(RaptorNestActivity.self)
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        guard let view = sb.instantiateViewController(withIdentifier: "dataentryvc") as? DataEntryTableViewController else {
            fatalError("Appropriate view controller not found!")
        }
        
        let _ = DataEntryTablePresenter(interactor: interactor, view: view)
        
        self.navigationController!.pushViewController(view, animated: true)
    }
}
