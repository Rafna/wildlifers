import UIKit

class RadioButtonEntryCell : UITableViewCell, DataEntryTableViewCell, UICollectionViewDelegate {
    var configuration: CellConfiguration?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? RadioButtonConfiguration else {
            fatalError("bad configuration passed to radiobuttonentrycell!")
        }
        
        descriptionLabel.text = configuration.descriptionText
        
        self.configuration = configuration
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.endEditing(true)
    }
}
