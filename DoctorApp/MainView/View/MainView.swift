import SwiftUI

struct MainView: View {
    init() {
        // viewModel.setData()
    }
    
    @StateObject private var viewModel = MainViewModel()
    @State private var searchText : String = ""
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack() {
                    SegmentControlView()
                }
                
            }
            .navigationTitle("Педиатры")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity)
            //.background(.appLightGray)
            .searchable(text: $searchText, prompt: "Look for you doc")
        }
        .onAppear() {
            // почему не хочет отображать белый цвет?
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        }
    }
}

#Preview {
    MainView()
}
