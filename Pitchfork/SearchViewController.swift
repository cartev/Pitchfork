//
//  SearchViewController.swift
//  Pitchfork
//
//  Created by Evan Carter on 6/29/16.
//  Copyright © 2016 Evan's iOS. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var ArtistField: UITextField!
    @IBOutlet weak var AlbumField: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var AlbumTitle: UILabel!
    @IBOutlet weak var ArtistName: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var Author: UILabel!
    @IBOutlet weak var Article: UILabel!
    @IBOutlet weak var AlbumCover: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Search(sender: AnyObject) {
        var artistName:String = ArtistField.text!
        var albumName:String = AlbumField.text!
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
