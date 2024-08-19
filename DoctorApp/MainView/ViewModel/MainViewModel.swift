import Foundation

final class MainViewModel : ObservableObject {
    private let dataService = DataService()
    @Published var data : [User] = []
    
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
