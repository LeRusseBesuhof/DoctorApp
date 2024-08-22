import Foundation
import SwiftUI

final class MainViewModel : ObservableObject {
    private let dataService = DataService()
    @Published var data : [User] = []
    @Published var chosenControlElement : ChooseParameter = .cost
    @Published var isPushed : Bool = false
    @Published var isPricePagePushed : Bool = false
    @Published var chosenDoctor : User?
    @Published var profileImage : Image = Image(.default)
    
    func getNetworkDoctors() {
        dataService.sendRequest { data in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.data = data.record.data.users
            }
        }
    }
    
    func getLocalDoctors() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            guard let users = dataService.loadUsersFromJSON() else {
                print("no doctors found")
                return
            }
            self.data = users
        }
    }
}
