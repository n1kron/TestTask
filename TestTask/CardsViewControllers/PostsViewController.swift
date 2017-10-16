
import UIKit

struct Post : Decodable {
    var id: Int
    var title: String
    var body: String
}


class PostsViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var n: String? = nil
    var textfieldValue: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        self.hideKeyboard()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 3
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    @IBAction func acceptButton(_ sender: Any) {
        n = textField.text
        getDataFromJson()
    }
    
    
    
    func getDataFromJson () {
       
        
        guard let postId = n else {
            return
        }
        
    let urlString = "https://jsonplaceholder.typicode.com/posts/\(postId)"
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
                let postId = try JSONDecoder().decode(Post.self, from: data)
                
                DispatchQueue.main.async {
                 //   print(postId)
                    self.titleLabel.text = postId.title
                    self.bodyLabel.text = postId.body
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}
