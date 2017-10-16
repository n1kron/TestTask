import UIKit

struct Comment : Decodable {
    var name: String
    var email: String
    var body: String
}

class CommentsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var n: String? = nil
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let maxLength = 3
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        self.shadowContainer()
        textField.delegate = self
    }
    
    
    @IBAction func acceptButton(_ sender: Any) {
        n = textField.text
        getDataFromJson()
    }
    
    
    func getDataFromJson () {
        guard let commentId = n else {
            return
        }
        
        let urlString = "https://jsonplaceholder.typicode.com/comments/\(commentId)"
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
                let commentId = try JSONDecoder().decode(Comment.self, from: data)
                
                DispatchQueue.main.async {
                  //  print(commentId)
                    self.nameLabel.text = commentId.name
                    self.emailLabel.text = commentId.email
                    self.bodyLabel.text = commentId.body
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
}

