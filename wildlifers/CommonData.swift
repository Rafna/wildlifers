import Foundation
import RealmSwift
import Realm

protocol RadioButton {
    var options:[String] { get }
    var selectedOption:Int { get set }
    
    init()
    init(selectedOption:Int)
}

extension RadioButton {
    init(selectedOption:Int) {
        self.init()
        self.selectedOption = selectedOption
    }
}

struct HintString {
    var string:String
    var hint:String
}

struct Precipitation: RadioButton {
    var options = ["None", "Light", "Moderate", "Heavy"]
    var selectedOption = -1
}

struct PrecipitationType: RadioButton {
    var options = ["Rain", "Snow", "Other"]
    var selectedOption = -1
}

struct Wind: RadioButton {
    var options = [ "Calm", "Light", "Moderate", "Strong"]
    var selectedOption = -1
}

struct CloudCover: RadioButton {
    var options = ["None", "PartlyCloudy", "MediumCloudy", "Overcast"]
    var selectedOption = -1
}

struct Aspect: RadioButton {
    var options = ["N", "E", "S", "W", "NE", "SE", "SW", "NW"]
    var selectedOption = -1
}

class Location : Object {
    var easting:Float = 0.0
    var northing:Float = 0.0
    var NAD:Int = 0
    var locationZone:String = ""
}

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) == true {
                return ($0 + " " + String($1))
            }
            
            if $0.characters.count == 0 {
                return $0.uppercased() + String($1)
            }
            
            return $0 + String($1)
        }
    }
}
