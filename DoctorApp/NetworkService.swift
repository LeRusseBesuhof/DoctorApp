import Foundation

protocol NetworkServiceProtocol : AnyObject {
    var url : URL! { get set }
    var request : URLRequest? { get set }
}

final class NetworkService : NetworkServiceProtocol {
    var url : URL! = URL(string: "https://api.jsonbin.io/v3/b/655b754e0574da7622c94aa4")
    var request: URLRequest?
    
    func getRequest(completion: @escaping (Welcome) -> Void) {
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
}
