//
//  detailViewController.swift
//  Project1
//
//  Created by Arash Zakeresfahani on 3/6/19.
//  Copyright © 2019 Arash Zakeresfahani. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var selectedRowIndexpath: Int?
    var totalCount: Int?

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var imageNum = selectedRowIndexpath {
            imageNum += 1
            if let totalCount = totalCount{
                title = ("\(imageNum) \\ \(totalCount)")
                 }
        }
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
     

        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
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
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No Image Found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
