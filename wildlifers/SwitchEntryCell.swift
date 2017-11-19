import UIKit

class SwitchEntryCell : UITableViewCell, DataEntryTableViewCell {
    var configuration:CellConfiguration?
    
    @IBOutlet private weak var toggle: UISwitch!    
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? SwitchConfiguration else { fatalError("invalid configuration passed to switch cell") }
        self.toggle.setOn(configuration.selected, animated: false)
        self.textLabel?.text = configuration.descriptionText
        
        self.configuration = configuration
    }
    
    @IBAction func onSwitchToggle(_ sender: Any) {
//        self.configuration.selected = self.toggle.isOn
        self.endEditing(true)
    }
}
