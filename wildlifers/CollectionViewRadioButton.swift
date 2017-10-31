import UIKit

class CollectionViewRadioButton : UICollectionViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        let selectedBackground = UIView(frame: self.frame)
        selectedBackground.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView = selectedBackground
        
        let deselectedBackground = UIView(frame: self.frame)
        deselectedBackground.backgroundColor = UIColor.clear
        self.backgroundView = deselectedBackground
    }
    
    override func select(_ sender: Any?) {
        super.select(sender)
        
        if self.isSelected {
            self.descriptionLabel.textColor = UIColor.white
        } else {
            self.descriptionLabel.textColor = UIColor.black
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
}
