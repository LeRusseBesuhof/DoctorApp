import SwiftUI

struct DoctorStackView: View {
    var docBase : [User]
    @StateObject var viewModel : DoctorStackViewModel
    var searchableString : String
    var chosenControlElement : ChooseParameter
    
    var body: some View {
        var filteredDocBase = searchableString.isEmpty ? docBase : viewModel.searchFilter(by: searchableString, docBase)
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
                    viewModel: viewModel
                )
            }
        }
    }
}

