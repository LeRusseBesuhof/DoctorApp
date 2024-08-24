import SwiftUI

struct DoctorStackView: View {
    var docBase : [User]
    @StateObject var viewModel : DoctorStackViewModel
    var searchableString : String
    
    var body: some View {
        let filteredDocBase = searchableString.isEmpty ? docBase : viewModel.searchFilter(by: searchableString, docBase)
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

