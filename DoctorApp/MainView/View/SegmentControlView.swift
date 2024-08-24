import SwiftUI

struct SegmentControlView: View {
    init(_ docArray : Binding<[User]>) {
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().selectedSegmentTintColor = .appPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        
        self._array = docArray
    }
    
    @State var selection: ChooseParameter = .cost
    @Binding var array : [User]
    
    @State private var arrowSymbols: [ChooseParameter: String] = [
        .cost: " \u{2193}",
        .seniority: " \u{2193}",
        .rating: " \u{2193}"
    ]
    @State private var arrowTogglers: [ChooseParameter: Bool] = [
        .cost: false,
        .seniority: false,
        .rating: false
    ]
    
    var body: some View {
        ZStack {
            Picker("Choose parameter", selection: $selection) {
                ForEach(ChooseParameter.allCases, id: \.self) { option in
                    Text(option.rawValue + arrowSymbols[option]!)
                        .tag(option)
                        .tint(.appPink)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                ForEach(ChooseParameter.allCases, id: \.self) { option in
                    Button(action: {
                        handleSelection(option)
                    }) {
                        Color.white
                    }
                    .opacity(0.1)
                }
            }
            .allowsHitTesting(true)
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    private func handleSelection(_ option: ChooseParameter) {
        if selection == option {
            toggleArrow(for: option)
        } else {
            selection = option
        }
        performSort(for: option)
    }
    
    private func toggleArrow(for option: ChooseParameter) {
        arrowTogglers[option]!.toggle()
        arrowSymbols[option] = arrowTogglers[option]! ? " \u{2191}" : " \u{2193}"
    }
    
    private func performSort(for parameter: ChooseParameter) {
        switch parameter {
        case .cost:
            array.sort {
                arrowTogglers[parameter]! ? $0.hospitalPrice < $1.hospitalPrice : $0.hospitalPrice > $1.hospitalPrice
            }
        case .seniority:
            array.sort {
                arrowTogglers[parameter]! ? $0.seniority < $1.seniority : $0.seniority > $1.seniority
            }
        case .rating:
            array.sort {
                arrowTogglers[parameter]! ? $0.ratingsRating < $1.ratingsRating : $0.ratingsRating > $1.ratingsRating
            }
        }
        
    }
}

enum ChooseParameter : String, CaseIterable, Hashable {
    case cost = "По цене"
    case seniority = "По стажу"
    case rating = "По рейтингу"
}
