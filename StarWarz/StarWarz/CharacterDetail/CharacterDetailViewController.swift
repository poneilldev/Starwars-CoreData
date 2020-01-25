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
    @IBOutlet weak var affliationImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        
    }

}
