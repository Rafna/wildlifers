import UIKit

class NumberEntryCell : UITableViewCell, DataEntryTableViewCell, UITextFieldDelegate {
    var configuration: CellConfiguration?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? NumberConfiguration else {
            fatalError("wrong configuration passed to numberentrycell!")
        }
        
        descriptionLabel.text = configuration.descriptionText
        numberField.text = String(configuration.number)
        
        self.configuration = configuration
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.endEditing(true)
    }
}
