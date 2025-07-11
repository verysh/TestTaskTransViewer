//
//  ProductViewController.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

final class ProductViewController: UIViewController {
    
    private lazy var productsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(cellTypes:[ProductTableViewCell.self])
        tableView.rowHeight = Constants.heightRow
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
        setUp()
        viewModel.fetchProducts()
    }
}

private extension ProductViewController {
    
    func setUp() {
        setupNavigationBarTitle("Products")
        configureTableView()
        setupConstraints()
    }
    
    func configureTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
    func setupConstraints() {
        view.addSubviews([productsTableView])
        NSLayoutConstraint.activate([
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            productsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectProduct(at: indexPath.row)
        productsTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.fetchNumberOfProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: ProductTableViewCell.self, for: indexPath)
        guard let product = viewModel.fetchProduct(at: indexPath.row) else { return UITableViewCell() }
        cell.configure(with: product)
        return cell
    }
}

extension ProductViewController: ProductsTransactionsViewModelDelegate {
    func updateData() {
        productsTableView.reloadData()
    }
}
