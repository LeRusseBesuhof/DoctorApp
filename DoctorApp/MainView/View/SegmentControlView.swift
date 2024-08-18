import SwiftUI

struct SegmentControlView: View {
    
    init() {
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().selectedSegmentTintColor = .appPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
    }
    
    @State private var selection : ChooseParameters = .cost
    
    var body: some View {
        Picker("Choose parameter", selection: $selection) {
            ForEach(ChooseParameters.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

enum ChooseParameters : String, CaseIterable {
    case cost = "По цене \u{2193}"
    case seniority = "По стажу \u{2193}"
    case rating = "По рейтингу \u{2193}"
}
