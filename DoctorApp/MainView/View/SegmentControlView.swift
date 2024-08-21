import SwiftUI

struct SegmentControlView: View {
    init(_ selection: Binding<ChooseParameter>) {
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().selectedSegmentTintColor = .appPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        
        self._selection = selection
    }
    
    @Binding var selection : ChooseParameter
    
    var body: some View {
        Picker("Choose parameter", selection: $selection) {
            ForEach(ChooseParameter.allCases, id: \.self) {
                if selection == $0 {
                    Text($0.rawValue + " \u{2193}")
                        .tag($0.self)
                } else {
                    Text($0.rawValue)
                        .tag($0.self)
                }
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

enum ChooseParameter : String, CaseIterable, Hashable {
    case cost = "По цене"
    case seniority = "По стажу"
    case rating = "По рейтингу"
}
