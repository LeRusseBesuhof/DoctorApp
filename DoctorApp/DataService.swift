import Foundation

protocol DataServiceProtocol : AnyObject {
    var url : URL! { get set }
    var request : URLRequest? { get set }
}

final class DataService : DataServiceProtocol {
    var url : URL! = URL(string: "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4")
    var request: URLRequest?
    
    func sendRequest(completion: @escaping (Welcome) -> Void) {
        request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request!) { data, response, error in
            var dataResponse : Welcome!
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                dataResponse = try JSONDecoder().decode(Welcome.self, from: data!)
                completion(dataResponse)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func loadUsersFromJSON() -> [User]? {
        guard let url = Bundle.main.url(forResource: "655b754e0574da7622c94aa4", withExtension: "json") else {
            print("Failed to locate users.json in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let dataResponse = try JSONDecoder().decode(Welcome.self, from: data)
            let users = dataResponse.record.data.users
            return users
        } catch {
            print("Failed to load or decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
