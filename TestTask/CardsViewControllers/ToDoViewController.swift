
import UIKit

struct ToDo : Decodable {
    var title: String
    var completed: Bool
}


class ToDoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var boolLabel: UILabel!
    
    
    var n: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shadowContainer()
        getDataFromJson()
    }
    
    
    func getDataFromJson () {
        
        let randomNumber = Int(arc4random_uniform(200) + 1)
        n = randomNumber
        
        guard let toDoId = n else {
            return
        }
        
        let urlString = "https://jsonplaceholder.typicode.com/todos/\(toDoId)"
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
                let toDoId = try JSONDecoder().decode(ToDo.self, from: data)
                
                if toDoId.completed == false {
                    DispatchQueue.main.async {
                    self.titleLabel.text = toDoId.title
                    self.boolLabel.text = "not done"
                    }
                }
                else {
                     DispatchQueue.main.async {
                    self.titleLabel.text = toDoId.title
                    self.boolLabel.text = "done"
                    }
                }
                
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
}

