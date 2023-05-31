//
//  TeamMemberCell.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import UIKit

class TeamMemberCell: UITableViewCell {

    @IBOutlet weak var memberName: UILabel!

    @IBOutlet weak var memberImage: UIImageView!
    
    @IBOutlet weak var memberRole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
