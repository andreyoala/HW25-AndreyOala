//
//  MTGView.swift
//  HW25-AndreyOala
//
//  Created by Andrey Oala on 05.08.2022.
//

import UIKit

class MTGView: UIView {

    // MARK: - View -

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(MTGTableViewCell.self,
                           forCellReuseIdentifier: MTGTableViewCell.identifier)
        return tableView
    }()

    // MARK: - Initial -

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings -

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

