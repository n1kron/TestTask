import UIKit

struct Photo : Decodable {
    var thumbnailUrl: String
}


class PhotosViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var n: Int? = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        self.shadowContainer()
        getDataFromJson()
        
    }
   
    func getDataFromJson () {
       
        guard let photoId = n else {
            return
        }
        
        let urlString = "https://jsonplaceholder.typicode.com/photos/\(photoId)"
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
                let photoId = try JSONDecoder().decode(Photo.self, from: data)
                let url = URL(string:photoId.thumbnailUrl)
                let data = try? Data(contentsOf: url!)
                let image: UIImage = UIImage(data: data!)!
                
                 DispatchQueue.main.async {
                self.imageView.image = image
                }
                
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
}
    


