import Quick
import Nimble

@testable import wildlifers

class DataEntryCellTypeSpec: QuickSpec {
    
    override func spec() {
        describe("when the dataentryviewmodel class has a string property") {
            class DummyDataEntryViewModel : DataEntryViewModel {
                var dummyString:String = ""
            }
            
            it("returns the cell configuration for that string") {
                let dataTypes = DummyDataEntryViewModel().dataEntryCellConfigurations
                
                expect(dataTypes.count).to(beGreaterThan(0))
                
                let stringConfigTuple = dataTypes[0]
                
                expect(stringConfigTuple.dataType).to(equal(DataEntryCellType.Text))
                expect(stringConfigTuple.cellConfiguration.descriptionText).to(equal("Dummy String"))
            }
        }
    }
}
