import Foundation
import SwiftUI

final class DoctorProfileViewModel : ObservableObject {
    @Binding var profileImage : Image
    @Binding var docData : User?
    @Published var isPricePagePushed : Bool = false
    
    init(_ profileImage: Binding<Image>, _ docData: Binding<User?>) {
        self._profileImage = profileImage
        self._docData = docData
    }
}
