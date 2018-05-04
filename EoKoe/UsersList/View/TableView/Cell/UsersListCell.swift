//
//  UsersListCell.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit
import Kingfisher

final class UsersListCell : UITableViewCell {

    @IBOutlet private weak var userIMage: UIImageView!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var userBio: UILabel!
    
    var model: Result? {
        didSet {
            updateUI()
        }
    }
}


extension UsersListCell {
    
    private func updateUI() {
        guard let model = model else { return }
        userBio.text = model.bio["mini"]
        let fisrtName = model.name["first"] ?? ""
        let lastName = model.name["last"] ?? ""
        userName.text = "\(fisrtName) \(lastName)"
        
        userIMage.contentMode = .scaleAspectFill
        userIMage.layer.cornerRadius = userIMage.bounds.height / 2
        userIMage.layer.masksToBounds = true
        userIMage.image = UIImage(named: "Profile")
        
        if let imageUrl = model.picture["mediumgit"], let url = URL(string: imageUrl) {
            self.userIMage.kf.setImage(with: url)
        }
    }

}
