import UIKit

class TextEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.Text
    @IBOutlet weak var textField: UITextField!
    
    func configure(configuration: TextConfiguration) {
        self.textLabel?.text = configuration.descriptionText
        self.textField.placeholder = configuration.hintText
    }
}
