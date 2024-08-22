import Foundation
import SwiftUI

final class DoctorStackViewModel : ObservableObject {
    @Binding var chosenDoctor : User?
    @Binding var profileImage : Image
    @Binding var isPushed : Bool
    
    init(_ chosenDoctor: Binding<User?>, _ profileImage: Binding<Image>, _ isPushed: Binding<Bool>) {
        self._chosenDoctor = chosenDoctor
        self._profileImage = profileImage
        self._isPushed = isPushed
    }
    
    func searchFilter(by searchStr: String, _ docBase: [User]) -> [User] {
        return docBase.filter { doc in
            doc.firstName.contains(searchStr) || doc.lastName.contains(searchStr) || getProfession(searchStr, doc.specialization).contains(searchStr)
        }
        
        func getProfession(_ str: String, _ specArray: [Specialization]) -> String {
            if specArray.isEmpty {
                return "Врач"
            } else {
                for el in specArray {
                    if el.name.contains(str) {
                        return el.name
                    }
                }
                return ""
            }
        }
    }
    
    func getSpecialization(_ specArray: [Specialization]) -> String {
        guard !specArray.isEmpty else {
            return "Врач"
        }
        var specialization = String()
        for spec in specArray {
            specialization += "\(spec.name)\n"
        }
        specialization.removeLast(2)
        return specialization
    }
}
