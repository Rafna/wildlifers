import Foundation

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) == true {
                return ($0 + " " + String($1))
            }
            
            if $0.characters.count == 1 {
                return $0.uppercased() + String($1)
            }
            
            return $0 + String($1)
        }
    }
}
