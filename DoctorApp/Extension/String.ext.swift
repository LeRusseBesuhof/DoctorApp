import Foundation

extension String {
    static func getSeniority(_ sen: Int) -> String {
        let decimalExceptions = Array(11...14)
        let digitExceptions = [1]
        let oneEnding = [1, 21, 31, 41, 51, 61, 71, 81, 91]
        var twoThreeFourEnding = Array(2...4) + Array(22...24) + Array(32...34)
        var count = 2
        while count < 5 {
            twoThreeFourEnding.append(count)
            count += 1
            
        }
        return ""
    }
}
