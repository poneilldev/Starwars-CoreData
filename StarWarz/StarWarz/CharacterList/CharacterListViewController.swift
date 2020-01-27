//
//  CharacterListViewController.swift
//  StarWarz
//
//  Created by Paul O'Neill on 1/25/20.
//  Copyright © 2020 Paul O'Neill. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    // MARK: - Attributes
    private var characters: [SWCharacter] = []
    private let manager = CharacterManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Helper Methods
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        loadingIndicator.hidesWhenStopped = true
        title = NSLocalizedString("Star Warz Characters", comment: "Title Page")
        getAllCharacters()
    }

    private func getAllCharacters() {
        loadingIndicator.startAnimating()
        manager.getCharacterList { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.characters = response.individuals
                    self?.loadingIndicator.stopAnimating()
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showError(error: error)
                    self?.loadingIndicator.stopAnimating()
                }
            }
        }
    }

    private func showError(error: Error) {
        let activityController = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Okay", comment: ""), style: .cancel, handler: nil)
        activityController.addAction(okAction)
        present(activityController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharacterListDetailSegue" {
            if let destinationVC = segue.destination as? CharacterDetailViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    destinationVC.character = characters[indexPath.row]
                }
            }
        }
    }

}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CharacterListDetailSegue", sender: self)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterListTableViewCell.cellHeight
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.identifier, for: indexPath) as! CharacterListTableViewCell
        cell.configureCell(character: characters[indexPath.row])
        return cell
    }
}

