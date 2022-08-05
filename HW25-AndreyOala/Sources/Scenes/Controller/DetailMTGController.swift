//
//  DetailMTGController.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import UIKit

class DetailMTGController: UIViewController {

    //MARK: - Properties -

    var card: DisplayableProtocol?

    private var detailMTGView: DetailMTGCardView? {
        guard isViewLoaded else { return nil }
        return view as? DetailMTGCardView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        view = DetailMTGCardView()
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      commonInit()
    }

    private func commonInit() {
        detailMTGView?.configure(with: card)
    }
}
