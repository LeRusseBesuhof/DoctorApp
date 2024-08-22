import SwiftUI

struct SegmentControlView: View {
    init(_ selection: Binding<ChooseParameter>) {
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().selectedSegmentTintColor = .appPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        
        self._selection = selection
    }
    
    @Binding var selection : ChooseParameter
    @State var arrowCymbol : String = " \u{2193}"
    @State var arrowToggler : Bool = false
    
    var body: some View {
        Picker("Choose parameter", selection: $selection) {
            ForEach(ChooseParameter.allCases, id: \.self) {
                if selection == $0 {
                    Text($0.rawValue + arrowCymbol)
                        .tag($0.self)
                } else {
                    Text($0.rawValue)
                        .tag($0.self)
                }
            }
        }
        .onTapGesture(count: 2, perform: {
            if arrowToggler {
                arrowCymbol = " \u{2191}"
                arrowToggler.toggle()
            } else {
                arrowCymbol = " \u{2193}"
                arrowToggler.toggle()
            }
        })
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    func arrowCymbolToggle(_ toggler: Bool) -> String {
        toggler ? " \u{2193}" : " \u{2191}"
    }
}

enum ChooseParameter : String, CaseIterable, Hashable {
    case cost = "По цене"
    case seniority = "По стажу"
    case rating = "По рейтингу"
}
