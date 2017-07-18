//
//  ViewController.swift
//  AsyncImageViewSample
//
//  Created by Panfilo Mariano on 18/07/2017.
//  Copyright © 2017 Panfilo Mariano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.estimatedRowHeight = 76
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }

    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let itemCount = 1000
        for i in 0...itemCount {
            let sampleEmail = "test\(i)@gmail.com"
            items.append(sampleEmail)
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let email = items[indexPath.row]
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let gravatarUrl = "https://www.gravatar.com/avatar/\(email.toMD5())?d=identicon"
        //Default image animation trasition is: .transitionCrossDissolve
        imageView.setImageFromUrl(urlString: gravatarUrl, withPlaceholder: #imageLiteral(resourceName: "placeholder"))
        
        //You can also set image animation by using the function with completion block
        //Just uncomment the code below
        /*
         imageView.setImageFromUrl(urlString: gravatarUrl, withPlaceholder: #imageLiteral(resourceName: "placeholder")) { (completed, image) in
            UIView.transition(with: imageView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                imageView.image = image
            }, completion: { (completed) in
                //Do what ever you want here
            })
        } 
         */
        
        let nameLabel = cell.contentView.viewWithTag(2) as! UILabel
        nameLabel.text = "Test Name\(indexPath.row + 1)"
        
        let emailLabel = cell.contentView.viewWithTag(2) as! UILabel
        emailLabel.text = email
        
        return cell
    }
}
