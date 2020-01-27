//
//  CharacterListTableViewCell.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterListTableViewCell: UITableViewCell {
    static let identifier = "CharacterListTableViewCell"
    static let cellHeight: CGFloat = 80
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(character: SWCharacter) {
        stylize()
        let url = URL(string: character.profilePicture)
        pictureImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "person.fill"))
        if character.lastName == "" {
            nameLabel.text = character.firstName
        } else {
            nameLabel.text = character.firstName + " " + character.lastName
        }

    }

    private func stylize() {
        pictureImageView.layer.cornerRadius = pictureImageView.frame.width/2
        pictureImageView.clipsToBounds = true
    }

}
