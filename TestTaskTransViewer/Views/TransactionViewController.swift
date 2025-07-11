//
//  TransactionViewController.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

final class TransactionViewController: UIViewController {
    
    private lazy var transactionsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(cellTypes:[TransactionTableViewCell.self])
        tableView.rowHeight = Constants.heightRow
        tableView.allowsSelection = false
        return tableView
    }()
    
    private var viewModel = ProductsTransactionsViewModel()
    
    //MARK:  Life cycle
    init(viewModel: ProductsTransactionsViewModel)  {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        setUp()
        viewModel.fetchRates()
    }
}

private extension TransactionViewController {
    func setUp() {
        setupNavigationBarTitle("Transactions for \(viewModel.selectedProductTitle())")
        configureTableView()
        setupConstraints()
    }
    
    func configureTableView() {
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
    }
    
    func setupConstraints() {
        view.addSubviews([transactionsTableView])
        NSLayoutConstraint.activate([
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transactionsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension TransactionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.totalSum()
    }
}

extension TransactionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fetchNumberOfTransactions()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: TransactionTableViewCell.self, for: indexPath)
        let transaction = viewModel.product.transactions[indexPath.row]
        let rates = viewModel.rates
        cell.configure(with: transaction, rates: rates)
        return cell
    }
}

extension TransactionViewController: ProductsTransactionsViewModelDelegate {
    func updateData() {
        transactionsTableView.reloadData()
    }
}
