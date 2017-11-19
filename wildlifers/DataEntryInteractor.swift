import Foundation
import Realm
import RealmSwift

class DataEntryTableInteractor {
    var newObject:Object
    let realm = try! Realm()
    
    var dataEntryCellConfigurations:[CellConfiguration] {
        get {
            guard let object = newObject as? DataEntryViewModel else {
                fatalError("your object is not conformant to dataentryviewmodel!")
            }
            
            return object.dataEntryCellConfigurations
        }
    }
    
    init(_ objectClass:Object.Type) {
        newObject = objectClass.init()
    }
    
    func save() {
        try! realm.write {
            realm.add(newObject)
        }
    }
    
    func setNumberForKeyPath(_ keyPath:String, number: Int) {
        self.newObject.setValue(number, forKeyPath: keyPath)
    }
    
    func setTextForKeyPath(_ keyPath:String, text:String) {
        self.newObject.setValue(text, forKeyPath: keyPath)
    }
    
    func setLocationForKeyPath(_ keyPath:String, location:Location) {
        self.newObject.setValue(location, forKey: keyPath)
    }
    
    func setRadioSelection(_ keyPath:String, selection:Int) {
        var radioButton = self.newObject.value(forKeyPath: keyPath) as? RadioButton
        
        radioButton?.selectedOption = selection
        
        self.newObject.setValue(radioButton, forKeyPath: keyPath)
    }
    
    func setBoolForKeyPath(_ keyPath:String, bool:Bool) {
        self.newObject.setValue(bool, forKeyPath: keyPath)
    }
}
