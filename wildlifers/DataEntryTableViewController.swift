import UIKit
import RealmSwift

protocol DataEntryTableViewCell {
    var type:DataEntryCellType { get }
}

class DataEntryTableViewController : UITableViewController {
    
    let presenter = DataEntryTablePresenter()
    var dataTypes:[DataEntryCellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTypes = [.Switch]
        let realm = try! Realm()
        let schema = realm.schema["RaptorNestActivity"]
        
        for property in schema!.properties {
            switch property.type {
            case .bool: print("bool")
            case .string: print("string")
            case .object: print("object")
            default: print("other")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTypes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataEntryType = dataTypes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: toString(cellType: dataEntryType))
        
        switch dataEntryType {
        case .Switch:
            (cell as! BooleanSwitchEntryCell).bindData(selected: false)
        case .Location: break
        case .Number: break
        case .RadioButtons: break
        case .Text: break
        case .SubDatumSegue: break
        case .TextDisplay: break
        }
        
        return cell!
    }
    
}
