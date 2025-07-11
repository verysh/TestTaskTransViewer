//
//  AppCoordinator.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit
import Foundation

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
    func showDetail(with product: Product)
}

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProductsTransactionsViewModel()
        viewModel.coordinator = self
        
        let vc = ProductViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetail(with product: Product) {
        let viewModel = ProductsTransactionsViewModel(product: product)
        
        let transactionVC = TransactionViewController(viewModel: viewModel)
        navigationController.pushViewController(transactionVC, animated: true)
    }
}
