//
//  CharacterDetailViewController.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var birthDateValue: UILabel!
    @IBOutlet weak var forceSensitiveLabel: UILabel!
    @IBOutlet weak var forceSensitiveValue: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    @IBOutlet weak var affiliationValue: UILabel!
    @IBOutlet weak var emptyStateLabel: UILabel!

    var character: SWCharacter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        stylize()
        guard let character = character else {
            emptyStateLabel.text = NSLocalizedString("Select Character...", comment: "")
            nameLabel.text = ""
            birthDateLabel.text = ""
            birthDateValue.text = ""
            forceSensitiveLabel.text = ""
            forceSensitiveValue.text = ""
            affiliationLabel.text = ""
            affiliationValue.text = ""
            return
        }
        emptyStateLabel.isHidden = true
        nameLabel.text = character.firstName + " " + character.lastName
        birthDateLabel.text = NSLocalizedString("Birthday: ", comment: "")
        birthDateValue.text = character.birthdate
        forceSensitiveLabel.text = NSLocalizedString("Force Sensitive: ", comment: "")
        forceSensitiveValue.text = String(character.forceSensitive).capitalized
        affiliationLabel.text = NSLocalizedString("Affiliation: ", comment: "")
        affiliationValue.text = AffiliationType(rawValue: character.affiliation)?.displayText ?? "Unknown"
        profileImageView.kf.setImage(with: URL(string: character.profilePicture), placeholder: UIImage(systemName: "person.fill"))
    }

    private func stylize() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true

    }

}
