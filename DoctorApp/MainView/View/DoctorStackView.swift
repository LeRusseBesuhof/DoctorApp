import SwiftUI

struct DoctorStackView: View {
    var docBase : [User]
    @Binding var chosenDoctor : User?
    @Binding var profileImage : Image?
    @Binding var isPushed : Bool
    var searchableString : String
    var chosenControlElement : ChooseParameter
    
    var body: some View {
        var filteredDocBase = searchableString.isEmpty ? docBase : searchFilter(by: searchableString, docBase)
        switch chosenControlElement {
        case .cost:
            let _ = filteredDocBase.sort { $0.hospitalPrice < $1.hospitalPrice }
        case .seniority:
            let _ = filteredDocBase.sort { $0.seniority > $1.seniority }
        case .rating:
            let _ = filteredDocBase.sort { $0.ratings.first!.value > $1.ratings.first!.value }
        }
        LazyVStack(spacing: -10) {
            ForEach(filteredDocBase) { docData in
                DoctorCardView(
                    docData: docData,
                    chosenDoctor: $chosenDoctor,
                    profileImage: $profileImage,
                    isPushed: $isPushed
                )
            }
        }
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
}

