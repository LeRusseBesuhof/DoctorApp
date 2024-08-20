import SwiftUI

struct DoctorStackView: View {
    var docBase : [User]
    @Binding var chosenDoctor : User?
    @Binding var profileImage : Image?
    @Binding var isPushed : Bool
    
    var body: some View {
        LazyVStack(spacing: -10) {
            ForEach(docBase) { docData in
                DoctorCardView(
                    docData: docData,
                    chosenDoctor: $chosenDoctor,
                    profileImage: $profileImage,
                    isPushed: $isPushed
                )
            }
        }
    }
}

