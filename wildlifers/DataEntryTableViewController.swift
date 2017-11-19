import UIKit
import RealmSwift

protocol DataEntryTableViewCell {
    var configuration:CellConfiguration? { get }
    func configure(configuration:CellConfiguration)
}

class DataEntryTableViewController : UITableViewController, UICollectionViewDataSource, DataEntryView {
    var dataTypes:[CellConfiguration] = []
    var presenter:DataEntryTablePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.done, target: self.presenter, action: #selector(presenter?.saveClicked))
    }
    
    func configure(_ configurations: [CellConfiguration]) {
        self.dataTypes = configurations
        self.tableView.reloadData()
    }
    
    // tableview methods:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTypes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfiguration = dataTypes[indexPath.row]
        let dataEntryType = cellConfiguration.type
        guard let cell = tableView.dequeueReusableCell(withIdentifier: dataEntryType.rawValue) as? DataEntryTableViewCell else {
            fatalError("No cell with that reuseID")
        }
        
        switch dataEntryType {
        case .RadioButton:
            let cell = cell as! RadioButtonEntryCell
            cell.collectionView.dataSource = self
            cell.collectionView.tag = indexPath.row
            cell.configure(configuration: cellConfiguration)
        default:
            cell.configure(configuration: cellConfiguration)
        }

        guard let returnCell = cell as? UITableViewCell else {
            fatalError("Cell not UITableViewCell inheritor")
        }

        return returnCell
    }
    
    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let cell = tableView.cellForRow(at: indexPath!) as? DataEntryTableViewCell else {
            return
        }

        self.presenter.dataUpdated(cell.configuration!)
    }
    
    // collectionview methods:
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cellConfiguration = dataTypes[collectionView.tag] as! RadioButtonConfiguration
        
        return cellConfiguration.options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let parentTableViewCellConfiguration = dataTypes[collectionView.tag] as! RadioButtonConfiguration
        let cellTitle = parentTableViewCellConfiguration.options[indexPath.row]
        let selected = parentTableViewCellConfiguration.selectedOption == indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rbutton", for: indexPath) as! CollectionViewRadioButton
        
        cell.isSelected = selected
        
        cell.descriptionLabel.text = cellTitle
        cell.descriptionLabel.sizeToFit()
        
        return cell
    }
}
