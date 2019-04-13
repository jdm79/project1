//
//  DetailViewController.swift
//  Project1
//
//  Created by James Daniel Malvern on 06/04/2019.
//  Copyright © 2019 Malvernation. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedPicture: String!
    var pictureTitle: String!
    
    @IBOutlet private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedPicture {
            title = pictureTitle
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
            
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image was found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [selectedPicture, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

