import UIKit

class BooleanSwitchEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.Switch
    @IBOutlet private weak var toggle: UISwitch!    
    
    func bindData(selected:Bool) {
        self.toggle.setOn(selected, animated: false)
    }
    
    func getData() -> Bool {
        return self.toggle.isOn
    }
}
