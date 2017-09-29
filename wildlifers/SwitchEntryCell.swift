import UIKit

class SwitchEntryCell : UITableViewCell, DataEntryTableViewCell {
    var type = DataEntryCellType.Switch
    @IBOutlet private weak var toggle: UISwitch!    
    
    func configure(configuration: SwitchConfiguration) {
        self.toggle.setOn(configuration.selected, animated: false)
        self.textLabel?.text = configuration.descriptionText
    }
    
    func getData() -> Bool {
        return self.toggle.isOn
    }
}
