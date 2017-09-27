import Foundation
import RealmSwift
import Realm

enum Precipitation: String {
    case None, Light, Moderate, Heavy
}

enum PrecipitationType: String {
    case Rain, Snow, Other
}

enum Wind: String {
    case Calm, Light, Moderate, Strong
}

enum CloudCover: String {
    case None, PartlyCloudy, MediumCloudy, Overcast
}

enum DisturbanceLevel: String {
    case None, Low, Moderate, High, Unrecorded
}

enum DisturbanceSource: String {
    case NotAvailable, Human, Wildlife, DomesticAnimals, MotorizedVehicle, NonmotorizedVehicle, Other
}

enum NestMonitoringLevel: String {
    case NewNestFirstVisit, HistoricNestFirstVisit, MonitoringVisit, FinalVisit, None
}

enum NestLocationStatus: String {
    case New, NewAlternateSite, ImprovedLocation, Known
}

enum NestSubstrate: String {
    case Cliff, RockOrEarthPinnacle, RockOutcrop, Ground, ManMadeStructure, Shrub, Tree
}

enum NestStatus: String {
    case Undetermined, OccupiedIntact, OccupiedFailed, UnoccupiedIntact, UnoccupiedDilapidated, Destroyed
}

class RaptorObservation : Object, DataEntryViewModel {
    var time:Date = Date.init()
    var observations:String = ""
    var behaviors:String = ""
    
    func getDataEntryCellTypes() -> [(dataType:DataEntryCellType, cellConfiguration: CellConfiguration)] {
        return [
            (dataType:.Text, cellConfiguration:
                TextConfiguration(
                    descriptionText:"\(#keyPath(RaptorObservation.observations))",
                    hintText:"",
                    enteredText:""
                )
            ),
            (dataType:.Text, cellConfiguration:
                TextConfiguration(
                    descriptionText:"\(#keyPath(RaptorObservation.behaviors))",
                    hintText:"",
                    enteredText:""
                )
            )]
    }
}

class RaptorNestActivity : Object, DataEntryViewModel {
    
    // classifications
    dynamic var siteName:String = ""
    dynamic var species:String = ""
    dynamic var observationPoint:Location = Location()
    
    private dynamic var monitoringLevelRaw:String = NestMonitoringLevel.None.rawValue
    var monitoringLevel:NestMonitoringLevel {
        get { return NestMonitoringLevel(rawValue: monitoringLevelRaw)! }
        set { monitoringLevelRaw = newValue.rawValue }
    }
    
    // weather
    dynamic var temperatureInF:Int = 0
    
    private dynamic var precipitationRaw:String = Precipitation.None.rawValue
    var precipitation:Precipitation {
        get { return Precipitation(rawValue: precipitationRaw)! }
        set { precipitationRaw = newValue.rawValue }
    }
    private dynamic var precipitationTypeRaw:String = PrecipitationType.Other.rawValue
    var precipitationType:PrecipitationType {
        get { return PrecipitationType(rawValue: precipitationTypeRaw)! }
        set { precipitationTypeRaw = newValue.rawValue }
    }
    dynamic var travelTimeToSite:TimeInterval = 0
    
    // disturbances
    dynamic var existingThreats:Bool = false
    private dynamic var disturbanceLevelRaw:String = DisturbanceLevel.None.rawValue
    var disturbanceLevel:DisturbanceLevel {
        get { return DisturbanceLevel(rawValue: disturbanceLevelRaw)! }
        set { disturbanceLevelRaw = newValue.rawValue }
    }
    private dynamic var disturbanceSourceRaw:String = DisturbanceSource.NotAvailable.rawValue
    var disturbanceSource:DisturbanceSource {
        get { return DisturbanceSource(rawValue: disturbanceSourceRaw)! }
        set { disturbanceSourceRaw = newValue.rawValue }
    }
    dynamic var disturbanceDescription:String?

    // nest location
    private dynamic var nestLocationStatusRaw:String = NestLocationStatus.New.rawValue
    var nestLocationStatus:NestLocationStatus {
        get { return NestLocationStatus(rawValue: nestLocationStatusRaw)! }
        set { nestLocationStatusRaw = newValue.rawValue }
    }
    dynamic var county:String = ""
    dynamic var publicLand:Bool = false
    dynamic var landOwner:String = ""
    dynamic var nestLocation:Location = Location()
    private dynamic var nestSubstrateRaw:String = NestSubstrate.Cliff.rawValue
    var nestSubstrate:NestSubstrate {
        get { return NestSubstrate(rawValue: nestSubstrateRaw)! }
        set { nestSubstrateRaw = newValue.rawValue }
    }
    dynamic var nestPlantAlive:Bool = false
    dynamic var nestPlantSpecies:String = ""
    private dynamic var nestStatusRaw:String = NestStatus.Undetermined.rawValue
    var nestStatus:NestStatus {
        get { return NestStatus(rawValue: nestStatusRaw)! }
        set { nestStatusRaw = newValue.rawValue }
    }
    private dynamic var nestAspectRaw:String = Aspect.N.rawValue
    var nestAspect:Aspect {
        get { return Aspect(rawValue: nestAspectRaw)! }
        set { nestAspectRaw = newValue.rawValue }
    }
    dynamic var active:Bool = false
    
    // birds
    dynamic var adultCount:Int = 0
    dynamic var eggCount:Int = 0
    dynamic var nestlingCount:Int = 0
    dynamic var fledglingCount:Int = 0
    
    dynamic var youngSize:String = ""
    final var plumageHint = "downy, half downy & half contour feathers, mostly contour feathers with down on nape"
    dynamic var youngPlumage:String = ""
    
    // observations
    final var significantBehaviors = "N/A, calling, copulation, courting, defending territory, disturbed/flushed, eating, feeding young, flying, hunting, incubating, nesting activity (building/cleaning/sitting), perched outside next, preening, no raptor present, other\n FOR YOUNG SPECIFICALLY: being fed by adult, flapping wings, hopping, lying flat, short flights, sibling rivalry, sitting in nest, sitting on edge of nest"
    let observations:List<RaptorObservation> = List<RaptorObservation>()
    
    func getDataEntryCellTypes() -> [(dataType: DataEntryCellType, cellConfiguration: CellConfiguration)] {
        return [
            (dataType: .Text,
             cellConfiguration: TextConfiguration(
                descriptionText:"\(#keyPath(RaptorNestActivity.siteName))",
                hintText:"",
                enteredText:""
                )
            ),
            (dataType: .Text,
             cellConfiguration: TextConfiguration(
                descriptionText:"\(#keyPath(RaptorNestActivity.species))",
                hintText:"",
                enteredText:""
                )
            ),
            (dataType: .Location,
             cellConfiguration: LocationConfiguration(
                descriptionText:"\(#keyPath(RaptorNestActivity.observationPoint))"
                )
            ),
            
        ]
    }
}
