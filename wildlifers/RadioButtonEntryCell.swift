import UIKit

class RadioButtonEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.RadioButton
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? RadioButtonConfiguration else {
            fatalError("bad configuration passed to radiobuttonentrycell!")
        }
        
        descriptionLabel.text = configuration.descriptionText
    }
}
