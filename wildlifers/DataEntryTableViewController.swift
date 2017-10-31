import UIKit
import RealmSwift

protocol DataEntryTableViewCell {
    var type:DataEntryCellType { get }
    func configure(configuration:CellConfiguration)
}

class DataEntryTableViewController : UITableViewController, UICollectionViewDataSource {
    
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
        
        switch dataEntryType {
        case .RadioButton:
            let cell = cell as! RadioButtonEntryCell
            cell.collectionView.dataSource = self
            cell.collectionView.tag = indexPath.row
            cell.configure(configuration: cellConfiguration)
        default:
            (cell as! DataEntryTableViewCell).configure(configuration: cellConfiguration)
        }
        
        return cell!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cellConfiguration = dataTypes[collectionView.tag].cellConfiguration as! RadioButtonConfiguration
        
        return cellConfiguration.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let parentTableViewCellConfiguration = dataTypes[collectionView.tag].cellConfiguration as! RadioButtonConfiguration
        let cellTitle = parentTableViewCellConfiguration.options[indexPath.row]
        let selected = parentTableViewCellConfiguration.selectedOption == indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rbutton", for: indexPath) as! CollectionViewRadioButton
        
        cell.isSelected = selected
        
        cell.descriptionLabel.text = cellTitle
        cell.descriptionLabel.sizeToFit()
        
        return cell
    }
}
