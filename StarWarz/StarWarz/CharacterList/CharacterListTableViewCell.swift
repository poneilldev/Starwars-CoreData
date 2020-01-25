//
//  CharacterListTableViewCell.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import UIKit

class CharacterListTableViewCell: UITableViewCell {
    static let identifier = "CharacterListTableViewCell"
    static let cellHeight: CGFloat = 115
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell() {
        
    }

}
