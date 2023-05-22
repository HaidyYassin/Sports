//
//  LeaguesTableCell.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit

class LeaguesTableCell: UITableViewCell {
    
    @IBOutlet weak var leagueImg: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    
}
