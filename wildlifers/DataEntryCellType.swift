import Foundation

protocol DataEntryViewModel {
    var dataEntryCellConfigurations:[(dataType: DataEntryCellType, cellConfiguration: CellConfiguration)] { get }
}

extension DataEntryViewModel {
    var dataEntryCellConfigurations:[(dataType: DataEntryCellType, cellConfiguration: CellConfiguration)] {
        get {
            var cellConfigurations = [(DataEntryCellType, CellConfiguration)]()
            let mirror = Mirror(reflecting: self)
            
            for (name, value) in mirror.children {
                guard let name = name else { continue }
                let type = type(of: value)
                
                switch type {
                case is String.Type:
                    cellConfigurations.append((
                        dataType: .Text,
                        cellConfiguration: TextConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            hintText:"",
                            enteredText:value as! String
                        )
                    ))
                    break
                case is HintString.Type:
                    cellConfigurations.append((
                        dataType: .Text,
                        cellConfiguration: TextConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            hintText:(value as! HintString).hint,
                            enteredText:(value as! HintString).string
                        )
                    ))
                    break
                case is Bool.Type:
                    cellConfigurations.append((
                        dataType: .Switch,
                        cellConfiguration: SwitchConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            selected:value as! Bool
                        )
                    ))
                    break
                case is RadioButton.Type:
                    cellConfigurations.append((
                        dataType: .RadioButton,
                        cellConfiguration: RadioButtonConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            selectedOption:(value as! RadioButton).selectedOption,
                            options:(value as! RadioButton).options.map { $0.camelCaseToWords() }
                        )
                    ))
                    break
                case is Location.Type:
                    cellConfigurations.append((
                        dataType: .Location,
                        cellConfiguration: LocationConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            location:value as! Location
                        )
                    ))
                    break
                case is Int.Type:
                    cellConfigurations.append((
                        dataType: .Number,
                        cellConfiguration: NumberConfiguration(
                            descriptionText:name.camelCaseToWords(),
                            number:Float(value as! Int)
                        )
                    ))
                    break
                default: break
                }
            }
            return cellConfigurations
        
        }
    }
}

protocol CellConfiguration {
    var descriptionText:String { get set }
}

enum DataEntryCellType:String {
    case Switch, Text, RadioButton, Number, Location, SubDatumSegue, SuperDatumSegue
}

struct SwitchConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var selected:Bool
}

struct LocationConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var location:Location
}

struct TextConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var hintText:String
    var enteredText:String
}

struct RadioButtonConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var selectedOption:Int
    var options:[String]
}

struct NumberConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var number:Float
}

