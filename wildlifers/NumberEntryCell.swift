import UIKit

class NumberEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.Number
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberField: UITextField!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? NumberConfiguration else {
            fatalError("wrong configuration passed to numberentrycell!")
        }
        
        descriptionLabel.text = configuration.descriptionText
        numberField.text = String(configuration.number)
    }
}
