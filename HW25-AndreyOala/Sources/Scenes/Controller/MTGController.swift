//
//  MTGController.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import UIKit
import Alamofire

class MTGController: UIViewController {

    //MARK: - Properties -

    private var cards: [Card] = []
    private let url = "https://api.magicthegathering.io/v1/cards"
    private var selectedCard: DisplayableProtocol?

    private var magicTheGatheringView: MTGView? {
        guard isViewLoaded else { return nil }
        return view as? MTGView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        view = MTGView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchCards()
    }

    //MARK: - Private functions -

    private func configureView() {
        title = "Magic The Gathering Cards"
        magicTheGatheringView?.tableView.delegate = self
        magicTheGatheringView?.tableView.dataSource = self
    }
}

//MARK: - Alamofire -

extension MTGController {
    private func fetchCards() {
        AF.request(url)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let data = response.value else { return }
                let cards = data.all
                self.cards = cards
                self.magicTheGatheringView?.tableView.reloadData()
            }
    }
}

//MARK: - UITableViewDataSource -

extension MTGController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MTGTableViewCell.identifier) as? MTGTableViewCell else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
}

//MARK: - UITableViewDelegate -

extension MTGController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedCard = cards[indexPath.row]
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = DetailMTGController()
        detailViewController.card = selectedCard
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}


