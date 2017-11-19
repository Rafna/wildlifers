import UIKit

class SubdatumSegueCell : UITableViewCell, DataEntryTableViewCell {
    var configuration: CellConfiguration?
    
    func configure(configuration: CellConfiguration) {
        
        self.configuration = configuration
        
    }
}
