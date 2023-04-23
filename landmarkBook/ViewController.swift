//
//  ViewController.swift
//  landmarkBook
//
//  Created by Emir Türk on 4.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var choosenNames = ""
    var choosenImage = UIImage()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonhenge")
        landmarkNames.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "collesium.jpg")!)
        landmarkImages.append(UIImage(named: "greatWall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "stonenge.jpg")!)
        landmarkImages.append(UIImage(named: "tajMahal.jpg")!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenNames = landmarkNames[indexPath.row]
        choosenImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVc" , sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "toDetailsVc" {
            let destinationVC = segue.destination as! detailsVc
            destinationVC.selectedName = choosenNames
            destinationVC.selectedImage = choosenImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

