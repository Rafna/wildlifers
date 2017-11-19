import Foundation
import RealmSwift
import Realm

struct DisturbanceLevel: RadioButton {
    var options = ["None", "Low", "Moderate", "High", "Unrecorded"]
    var selectedOption = -1
}

struct DisturbanceSource: RadioButton {
    var options = ["NotAvailable", "Human", "Wildlife", "DomesticAnimals", "MotorizedVehicle", "NonmotorizedVehicle", "Other"]
    var selectedOption = -1
}

struct NestMonitoringLevel: RadioButton {
    var options = ["NewNestFirstVisit", "HistoricNestFirstVisit", "MonitoringVisit", "FinalVisit", "None"]
    var selectedOption = -1
}

struct NestLocationStatus: RadioButton {
    var options = ["New", "NewAlternateSite", "ImprovedLocation", "Known"]
    var selectedOption = -1
}

struct NestSubstrate: RadioButton {
    var options = ["Cliff", "RockOrEarthPinnacle", "RockOutcrop", "Ground", "ManMadeStructure", "Shrub", "Tree"]
    var selectedOption = -1
}

struct NestStatus: RadioButton {
    var options = ["Undetermined", "OccupiedIntact", "OccupiedFailed", "UnoccupiedIntact", "UnoccupiedDilapidated", "Destroyed"]
    var selectedOption = -1
}

class RaptorObservation : Object, DataEntryViewModel {
    var time:Date = Date.init()
    var observations:String = ""
    var behaviors:String = ""
}

class RaptorNestActivity : Object, DataEntryViewModel {
    
    // classifications
    dynamic var siteName:String = ""
    dynamic var species:String = ""
    dynamic var observationPoint:Location?
    
    private dynamic var monitoringLevelRaw:String {
        get { return monitoringLevel.selectedOption >= 0 ? monitoringLevel.options[monitoringLevel.selectedOption] : "" }
    }
    var monitoringLevel:NestMonitoringLevel = NestMonitoringLevel()
    
    // weather
    dynamic var temperatureInF:Int = 0
    
    private dynamic var precipitationRaw:String {
        get { return precipitation.selectedOption >= 0 ? precipitation.options[precipitation.selectedOption] : "" }
    }
    var precipitation:Precipitation = Precipitation()
    private dynamic var precipitationTypeRaw:String {
        get { return precipitationType.selectedOption >= 0 ? precipitationType.options[precipitationType.selectedOption] : ""  }
    }
    var precipitationType:PrecipitationType = PrecipitationType()
    dynamic var travelTimeToSite:String = ""
    
    // disturbances
    dynamic var existingThreats:Bool = false
    private dynamic var disturbanceLevelRaw:String {
        get { return disturbanceLevel.selectedOption >= 0 ? disturbanceLevel.options[disturbanceLevel.selectedOption] : "" }
    }
    var disturbanceLevel:DisturbanceLevel = DisturbanceLevel()
    private dynamic var disturbanceSourceRaw:String {
        get { return disturbanceSource.selectedOption >= 0 ? disturbanceSource.options[disturbanceSource.selectedOption] : "" }
    }
    var disturbanceSource:DisturbanceSource = DisturbanceSource()
    dynamic var disturbanceDescription:String = ""

    // nest location
    private dynamic var nestLocationStatusRaw:String {
        get { return nestLocationStatus.selectedOption >= 0 ? nestLocationStatus.options[nestLocationStatus.selectedOption] : "" }
    }
    var nestLocationStatus:NestLocationStatus = NestLocationStatus()
    dynamic var county:String = ""
    dynamic var publicLand:Bool = false
    dynamic var landOwner:String = ""
    dynamic var nestLocation:Location?
    private dynamic var nestSubstrateRaw:String {
        get { return nestSubstrate.selectedOption >= 0 ? nestSubstrate.options[nestSubstrate.selectedOption] : "" }
    }
    var nestSubstrate:NestSubstrate = NestSubstrate()
    dynamic var nestPlantAlive:Bool = false
    dynamic var nestPlantSpecies:String = ""
    private dynamic var nestStatusRaw:String {
        get { return nestStatus.selectedOption >= 0 ? nestStatus.options[nestStatus.selectedOption] : "" }
    }
    var nestStatus:NestStatus = NestStatus()
    private dynamic var nestAspectRaw:String {
        get { return nestAspect.selectedOption >= 0 ? nestAspect.options[nestAspect.selectedOption] : "" }
    }
    var nestAspect:Aspect = Aspect()
    dynamic var active:Bool = false
    
    // birds
    dynamic var adultCount:Int = 0
    dynamic var eggCount:Int = 0
    dynamic var nestlingCount:Int = 0
    dynamic var fledglingCount:Int = 0
    
    dynamic var youngSize:String = ""
    private dynamic var youngPlumage:String {
        get { return plumageHint.string }
    }
    final var plumageHint:HintString = HintString(
        string:"",
        hint:"downy, half downy & half contour feathers, mostly contour feathers with down on nape")
    
    // observations
    final var significantBehaviors = "N/A, calling, copulation, courting, defending territory, disturbed/flushed, eating, feeding young, flying, hunting, incubating, nesting activity (building/cleaning/sitting), perched outside next, preening, no raptor present, other\n FOR YOUNG SPECIFICALLY: being fed by adult, flapping wings, hopping, lying flat, short flights, sibling rivalry, sitting in nest, sitting on edge of nest"
    let observations:List<RaptorObservation> = List<RaptorObservation>()
}
