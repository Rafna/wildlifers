import UIKit

class RadioButtonEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.RadioButton
    
    func configure(configuration: CellConfiguration) {
        guard configuration is RadioButtonConfiguration else { fatalError("bad configuration!!") }
    }
}
