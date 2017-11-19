import UIKit

class LocationEntryCell : UITableViewCell, DataEntryTableViewCell, UITextFieldDelegate {
    var configuration: CellConfiguration?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var utmXField: UITextField!
    @IBOutlet weak var utmYField: UITextField!
    @IBOutlet weak var NADField: UITextField!
    @IBOutlet weak var zoneField: UITextField!
    
    
    func configure(configuration: CellConfiguration) {
        guard let configuration = configuration as? LocationConfiguration else { fatalError("wrong configuration passed to locationentrycell!") }
        
        descriptionLabel.text = configuration.descriptionText
        utmXField.text = String(configuration.location.easting)
        utmYField.text = String(configuration.location.northing)
        NADField.text = String(configuration.location.NAD)
        zoneField.text = String(configuration.location.locationZone)
        
        self.configuration = configuration
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.endEditing(true)
    }
}
