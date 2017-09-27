import Foundation

protocol DataEntryViewModel {
    func getDataEntryCellTypes() -> [(dataType: DataEntryCellType, cellConfiguration: CellConfiguration)]
}

extension DataEntryViewModel {
    func getDataEntryCellTypes() -> [(dataType: DataEntryCellType, cellConfiguration: CellConfiguration)] {
        fatalError("cell entry types not defined for this model!")
    }
}

protocol CellConfiguration {
    var descriptionText:String { get set }
}

enum DataEntryCellType {
    case Switch, Text, RadioButtons, Number, Location, SubDatumSegue, TextDisplay
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
}

struct NumberConfiguration: CellConfiguration {
    var descriptionText: String = ""
    var number:Float
}


func toString(cellType:DataEntryCellType) -> String {
    switch cellType {
    case .Switch: return "switch"
    case .Location: return "location"
    case .Number: return "number"
    case .RadioButtons: return "radiobuttons"
    case .Text: return "text"
    case .SubDatumSegue: return "subdatumsegue"
    case .TextDisplay: return "textdisplay"
    }
}

