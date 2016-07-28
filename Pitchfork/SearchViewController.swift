//
//  SearchViewController.swift
//  Pitchfork
//
//  Created by Evan Carter on 6/29/16.
//  Copyright © 2016 Evan's iOS. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON

class SearchViewController: UIViewController {

    @IBOutlet weak var ArtistField: UITextField!
    @IBOutlet weak var AlbumField: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var AlbumTitle: UILabel!
    @IBOutlet weak var ArtistName: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var RecordLabel: UILabel!
    @IBOutlet weak var Article: UILabel!
    @IBOutlet weak var AlbumCover: UIImageView!
    @IBOutlet weak var scroller: UIScrollView!
    
    var PitchforkAPIURLBase = "http://www.evancarter.me/time/api/pitchfork/search/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // scroller.contentSize = CGSizeMake(400, 4000)
        ArtistField.layer.borderWidth = 0.5
        ArtistField.layer.cornerRadius = 5
        AlbumField.layer.borderWidth = 0.5
        AlbumField.layer.cornerRadius = 5
        SearchButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews(){
        scroller.scrollEnabled = true
    }
    
    @IBAction func Search(sender: AnyObject) {
        let artistName:String = ArtistField.text!
        let albumName:String = AlbumField.text!
        let url = PitchforkAPIURLBase +
                        urlParameterPrep(artistName) + "/" +
                        urlParameterPrep(albumName)
        
        ArtistField.text = ""
        AlbumField.text = ""
        
        Alamofire.request(.GET, url)
            .validate()
            .responseJSON { response in switch response.result{
                    case .Success(let JSON):
                        let response = JSON as! NSDictionary
                        print(response)
                        
                        self.ArtistName.text = response.objectForKey("artist")! as? String
                        self.AlbumTitle.text = response.objectForKey("album")! as? String
                        let score:Float = (response.objectForKey("score")! as? Float)!
                        if score > 9.9 {
                            self.Rating.text = String(Int(score))
                        }else{
                            self.Rating.text = String(score)
                        }
                        self.RecordLabel.text = response.objectForKey("label")! as? String
                        
                        // Pitchfork API review.cover() not working - [no attubiute img for stripping 'src' from 
                            // (pitchfork.py line 151) ]
                        // let coverArtUrl = NSURL(string: response.objectForKey("cover") as! String)
                        // let data = NSData(contentsOfURL: coverArtUrl!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                        // self.AlbumCover.image = UIImage(data: data!)
                        
                        // tabbing / indenting lines in UILabels has its difficulties
                        // approximate tab indentation is 5 spaces to simulate first line indent
                        self.Article.text = "     " + (response.objectForKey("editorial") as! String)
                        self.Article.sizeToFit()
                
                        // resize scroll view
                         self.scroller.contentSize = CGSizeMake(400, self.scroller.frame.size.height + CGFloat(self.Article.frame.size.height))
                         print("self.scroller.frame.size.height = " + String(self.scroller.frame.size.height))
                         print("self.Article.frame.size.height = " + String(CGFloat(self.Article.frame.size.height)))
                         print(self.scroller.frame.size.height + CGFloat(self.Article.numberOfLines))
                
                
                
                    case .Failure( _):
                        // error type - if 404, say album cannot be found
                        self.AlbumTitle.text = "Album Could Not be Found"
                }
        }
        
        
        
    }
    
    func urlParameterPrep(param:String) -> String{
        var newParam:String = ""
        for i in param.characters{
            if (String(i) == " "){
                newParam += "_"
            }else{
                newParam += String(i)
            }
        }
        return newParam
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
