import UIKit
import RealmSwift

protocol DataEntryTableViewCell {
    var type:DataEntryCellType { get }
    func configure(configuration:CellConfiguration)
}

extension DataEntryTableViewCell {
    func configure(configuration:CellConfiguration) {
        fatalError("wrong type of configuration passed to cell!")
    }
}

class DataEntryTableViewController : UITableViewController {
    
    let presenter = DataEntryTablePresenter()
    var dataTypes:[(dataType:DataEntryCellType, cellConfiguration:CellConfiguration)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity = RaptorNestActivity()
        dataTypes = activity.dataEntryCellConfigurations
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTypes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfiguration = dataTypes[indexPath.row].cellConfiguration
        let dataEntryType = dataTypes[indexPath.row].dataType
        let cell = tableView.dequeueReusableCell(withIdentifier: dataEntryType.rawValue)
        
        (cell as! DataEntryTableViewCell).configure(configuration: cellConfiguration)
        
        return cell!
    }
    
}
