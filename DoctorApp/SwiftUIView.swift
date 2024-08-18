import SwiftUI

struct SwiftUIView: View {
    @State private var isActive : Bool = false
    @State private var text : String = ""
    var body: some View {
        NavigationStack {
            List {
                Text("Hello, SwiftUI!")
            }
            .navigationTitle("Navigation Title")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $text)
            
            .toolbarBackground(
                Color.red,
                for: .navigationBar
            )
        }
    }
}

#Preview {
    SwiftUIView()
}
