import UIKit

struct User : Decodable {
    var id: Int
    var name: String
    var username: String
}

class UsersViewController: UIViewController {

    @IBOutlet weak var userNameFirst: UILabel!
    @IBOutlet weak var userNameSecond: UILabel!
    @IBOutlet weak var userNameThird: UILabel!
    @IBOutlet weak var userNameFourth: UILabel!
    @IBOutlet weak var userNameFifth: UILabel!
    
    var n: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shadowContainer()
        getDataFromJson()
    }
    

    func getDataFromJson () {
        
            for n  in 1...5 {
        let urlString = "https://jsonplaceholder.typicode.com/users/\(n)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("No data")
                return
            }
            guard error == nil else {
                print("Got error: \(error!)")
                return
            }
            do {
                let userId = try JSONDecoder().decode(User.self, from: data)
               
                if userId.id == 1{
                DispatchQueue.main.async {
                    self.userNameFirst.text = userId.username
                        }
                }
                   else if userId.id == 2{
                        DispatchQueue.main.async {
                            self.userNameSecond.text = userId.username
                        }
                }
                        else if userId.id == 3{
                            DispatchQueue.main.async {
                                self.userNameThird.text = userId.username
                        }
                }
                            else if userId.id == 4{
                                DispatchQueue.main.async {
                                    self.userNameFourth.text = userId.username
                        }
                }
                                else if userId.id == 5{
                                    DispatchQueue.main.async {
                                        self.userNameFifth.text = userId.username
                        }
                }
            } catch let error {
                print(error)
            }
            }.resume()
            
    }
    
  }

}

