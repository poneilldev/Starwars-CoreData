//
//  CharacterListSplitViewController.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/26/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import UIKit

class CharacterListSplitViewController: UISplitViewController,
                                  UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }

    func splitViewController(
             _ splitViewController: UISplitViewController,
             collapseSecondary secondaryViewController: UIViewController,
             onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
