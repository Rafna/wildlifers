import UIKit

class TextEntryCell : UITableViewCell, DataEntryTableViewCell, UITextViewDelegate {
    var configuration:CellConfiguration?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? TextConfiguration else { fatalError("bad configuration!!") }
        
        self.configuration = configuration
        self.descriptionLabel.text = configuration.descriptionText
        self.textView.text = configuration.hintText
        
        self.configuration = configuration
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.endEditing(true)
    }
}
