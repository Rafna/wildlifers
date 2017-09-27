import Foundation
import RealmSwift
import Realm

enum Aspect : String {
    case N, E, S, W, NE, SE, SW, NW
}

class Location : Object {
    var easting:Float = 0.0
    var northing:Float = 0.0
    var NAD:Int = 0
    var locationZone:String = ""
}
