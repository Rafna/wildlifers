import Foundation

protocol DataEntryViewModel {
    var dataEntryCellConfigurations:[CellConfiguration] { get }
}

extension DataEntryViewModel {
    var dataEntryCellConfigurations:[CellConfiguration] {
        get {
            var cellConfigurations = [CellConfiguration]()
            let mirror = Mirror(reflecting: self)
            
            for (name, value) in mirror.children {
                guard let name = name else { continue }
                let type = type(of: value)
                
                switch type {
                case is String.Type:
                    cellConfigurations.append(
                        TextConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            hintText:"",
                            enteredText:value as! String
                        )
                    )
                    break
                case is HintString.Type:
                    cellConfigurations.append(
                        TextConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            hintText:(value as! HintString).hint,
                            enteredText:(value as! HintString).string
                        )
                    )
                    break
                case is Bool.Type:
                    cellConfigurations.append(
                        SwitchConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            selected:value as! Bool
                        )
                    )
                    break
                case is RadioButton.Type:
                    cellConfigurations.append(
                        RadioButtonConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            selectedOption:(value as! RadioButton).selectedOption,
                            options:(value as! RadioButton).options.map { $0.camelCaseToWords() }
                        )
                    )
                    break
                case is Location.Type:
                    cellConfigurations.append(
                        LocationConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            location:value as! Location
                        )
                    )
                    break
                case is Int.Type:
                    cellConfigurations.append(
                        NumberConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            keyPath:name,
                            number:Float(value as! Int)
                        )
                    )
                    break
                default: break
                }
            }
            return cellConfigurations
        }
    }
}


enum DataEntryCellType:String {
    case Switch, Text, RadioButton, Number, Location, SubDatumSegue, SuperDatumSegue
}

protocol CellConfiguration {
    var descriptionText:String { get set }
    var keyPath:String { get set }
    var type:DataEntryCellType { get set }
}

struct SwitchConfiguration: CellConfiguration {
    var type:DataEntryCellType
    var descriptionText: String
    var keyPath:String
    var selected:Bool
    
    init(descriptionText:String, keyPath:String, selected:Bool, type:DataEntryCellType? = DataEntryCellType.Switch) {
        self.type = type!
        self.descriptionText = descriptionText
        self.keyPath = keyPath
        self.selected = selected
    }
}

struct LocationConfiguration: CellConfiguration {
    var type:DataEntryCellType
    var descriptionText: String
    var keyPath:String
    var location:Location
    
    init(descriptionText:String, keyPath:String, location:Location, type:DataEntryCellType? = DataEntryCellType.Location) {
        self.type = type!
        self.descriptionText = descriptionText
        self.keyPath = keyPath
        self.location = location
    }
}

struct TextConfiguration: CellConfiguration {
    var type:DataEntryCellType
    var descriptionText: String
    var keyPath:String
    var hintText:String
    var enteredText:String
    
    init(descriptionText:String, keyPath:String, hintText:String, enteredText:String, type:DataEntryCellType? = DataEntryCellType.Text) {
        self.type = type!
        self.descriptionText = descriptionText
        self.keyPath = keyPath
        self.hintText = hintText
        self.enteredText = enteredText
    }
}

struct RadioButtonConfiguration: CellConfiguration {
    var type:DataEntryCellType
    var descriptionText: String
    var keyPath:String
    var selectedOption:Int
    var options:[String]
    
    init(descriptionText:String, keyPath:String, selectedOption:Int, options:[String], type:DataEntryCellType? = DataEntryCellType.RadioButton) {
        self.type = type!
        self.descriptionText = descriptionText
        self.keyPath = keyPath
        self.selectedOption = selectedOption
        self.options = options
    }
}

struct NumberConfiguration: CellConfiguration {
    var type:DataEntryCellType = DataEntryCellType.Number
    var descriptionText: String = ""
    var keyPath:String = ""
    var number:Float
    
    init(descriptionText:String, keyPath:String, number:Float, type:DataEntryCellType? = DataEntryCellType.Number) {
        self.type = type!
        self.descriptionText = descriptionText
        self.keyPath = keyPath
        self.number = number
    }
}

