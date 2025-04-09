import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        view.backgroundColor = .white
        
        // Create an ImageView
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "boundaryBuilding") // Replace with your image name
        imageView.contentMode = .scaleAspectFit
        
        // Add the ImageView to the main view
        view.addSubview(imageView)
        
        // Set up Auto Layout constraints
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor) // Maintain aspect ratio (square in this case)
        ])
    }
}
