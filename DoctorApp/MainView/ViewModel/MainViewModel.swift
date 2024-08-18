import Foundation

protocol MainViewModelProtocol : AnyObject {
    func setData()
}

final class MainViewModel : MainViewModelProtocol, ObservableObject {
    private let networkService = NetworkService()
    @Published var data : Welcome!
    
    func setData() {
        networkService.getRequest { data in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.data = data
                print(self.data)
            }
        }
    }
}
