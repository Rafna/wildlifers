import Foundation
import RealmSwift
import Realm

protocol DataEntryView {
    func configure(_ configurations:[CellConfiguration])
}

class DataEntryTablePresenter : NSObject {
    let interactor:DataEntryTableInteractor
    let view:DataEntryView
    
    init(interactor:DataEntryTableInteractor, view:DataEntryView) {
        self.interactor = interactor
        self.view = view
        
        self.view.configure(interactor.dataEntryCellConfigurations)
    }
    
    @objc func saveClicked() {
        self.interactor.save()
    }
    
    func dataUpdated(_ configuration:CellConfiguration) {
        switch configuration.type {
        case .Text:
            guard let configuration = configuration as? TextConfiguration else { fatalError("how did you get that") }
            self.interactor.setTextForKeyPath(configuration.keyPath, text: configuration.enteredText)
            break
        case .Location:
            guard let configuration = configuration as? LocationConfiguration else { fatalError("not a location config!") }
            self.interactor.setLocationForKeyPath(configuration.keyPath, location: configuration.location)
            break
        case .Number:
            guard let configuration = configuration as? NumberConfiguration else { fatalError("not a number config!") }
            self.interactor.setNumberForKeyPath(configuration.keyPath, number: Int(configuration.number))
            break
        case .RadioButton:
            guard let configuration = configuration as? RadioButtonConfiguration else { fatalError("not a not a radio button config!") }
            self.interactor.setRadioSelection(configuration.keyPath, selection:configuration.selectedOption)
            break
        case .Switch:
            guard let configuration = configuration as? SwitchConfiguration else { fatalError("not a not a radio button config!") }
            self.interactor.setBoolForKeyPath(configuration.keyPath, bool:configuration.selected)
            break
        default:
            break
        }
        
    }
    
}
