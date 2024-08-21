import Foundation

extension String {
    static func getSeniority(_ age: Int) -> String {
        let oneEnding : Set<Int> = [1, 21, 31, 41, 51, 61, 71, 81, 91]
        var twoToFourEnding : Set<Int> = Set()
        var count = 2
        while count < 95 {
            if (count % 10 > 1 && count % 10 < 5) && (count < 5 || count > 14) {
                twoToFourEnding.insert(count)
                count += 1
            } else {
                count += 1
            }
        }
        
        let decAge = age % 100
        if oneEnding.contains(decAge) {
            return "год"
        } else if twoToFourEnding.contains(decAge) {
            return "года"
        } else {
            return "лет"
        }
    }
}
