//
//  FeedCell.swift
//  iFunpedia
//
//  Created by M Usman Saeed on 01/04/2016.
//  Copyright © 2016 Soarlabs. All rights reserved.
//

import UIKit

protocol FeedCellDelegate: class
{
    func didClickByeNow(feedObj: MFeed)
}

class FeedCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UITextView!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var delegate: FeedCellDelegate?
    var feedObj:MFeed?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func btnBuyNow(sender: AnyObject) {
        
        self.delegate?.didClickByeNow(self.feedObj!)
        
    }
    
}
