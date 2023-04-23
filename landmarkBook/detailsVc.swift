//
//  detailsVc.swift
//  landmarkBook
//
//  Created by Emir Türk on 5.02.2023.
//

import UIKit

class detailsVc: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedName = ""
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedName
        imageView.image = selectedImage

    }
    

   

}
