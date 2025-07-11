//
//  ProductsTransactionsViewModel.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import Foundation

protocol ProductsTransactionsViewModelDelegate: AnyObject {
    func updateData()
}

final class ProductsTransactionsViewModel {
    
    weak var delegate: ProductsTransactionsViewModelDelegate?
    
    var coordinator: AppCoordinator?
    
    var rates: [Rate] = [Rate]()
    var product = Product(name: "", transactions: [])
    
    private var products: [Product] = [Product]()
    
    init(product: Product = Product(name: "", transactions: [])) {
        self.product = product
    }
    
    func fetchProducts() {
        fetchProdstrans()
    }
    
    func fetchNumberOfProducts() -> Int {
        return products.count
    }
    
    func fetchProduct(at index: Int) -> Product? {
        guard index < products.count else { return nil }
        return products[index]
    }
    
    func didSelectProduct(at index: Int) {
        let product = products[index]
        if let coordinator = coordinator {
            coordinator.showDetail(with: product)
        }
    }
    
    func selectedProductTitle() -> String {
        product.name
    }
    
    func fetchRates() {
        DataManager.fetchAllRates { [weak self] rates in
            self?.rates = rates
        }
    }
    
    func totalSum() -> String {
        fetchTotalSum()
    }
    
    func fetchNumberOfTransactions() -> Int {
        product.transactions.count
    }
}

private extension ProductsTransactionsViewModel {
    func fetchProdstrans() {
        DataManager.fetchAllTransaction(completion: { [weak self] transactions in
            self?.fetchProducts(transactions: transactions)
        })
    }
    
    func fetchProducts(transactions: [Transaction])  {
        let transGroups = Dictionary(grouping: transactions, by: { $0.sku })
        for (sku, transactions) in transGroups {
            let product = Product(name: sku, transactions: transactions)
            products.append(product)
        }
        products.sort(by: {$0.name < $1.name })
        delegate?.updateData()
    }
    
    func fetchTotalSum() -> String {
        var sum:Double = 0.0
        var amount: Double = 0.0
        for item in product.transactions {
            if item.currency == Constants.currency {
                amount = ((Double(item.amount)! * 1))
            } else {
                guard let rateAsDouble = Double(rates.first(where: { $0.from == item.currency })?.rate ?? "") else { return "" }
                amount = Double(item.amount)! * rateAsDouble
            }
            
            sum += amount
        }
        
        return "Total: \((sum).formatted(.currency(code: Constants.currency)))"
    }
}
