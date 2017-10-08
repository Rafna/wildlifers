import UIKit

class TextEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.Text
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? TextConfiguration else { fatalError("bad configuration!!") }
        self.descriptionLabel.text = configuration.descriptionText
        self.textView.text = configuration.hintText
    }
}
