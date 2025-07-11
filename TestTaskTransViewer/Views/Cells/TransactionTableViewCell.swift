//
//  TransactionTableViewCell.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

final class TransactionTableViewCell: UITableViewCell {

    //MARK: Subviews
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    //MARK: Constraints
    private func setupConstraints() {
        addSubviews([stackView])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor,constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -12),
        ])
    }
    
    //MARK: Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with item: Transaction, rates: [Rate]) {
        guard let itemAsDouble = Double(item.amount) else { return }
        titleLabel.text = "\(itemAsDouble.formatted(.currency(code: item.currency)))"
        descriptionLabel.text = formattDescription(amount: itemAsDouble, currency: item.currency, rates: rates)
    }
}

private extension TransactionTableViewCell {
    func formattDescription(amount: Double, currency: String, rates: [Rate]) -> String {
        if currency == Constants.currency {
            return  "\((amount * 1).formatted(.currency(code: Constants.currency)))"
        }
        guard let doubleRate = Double(rates.first(where: { $0.from == currency })?.rate ?? "") else { return "" }
        return "\((amount * doubleRate).formatted(.currency(code: Constants.currency)))"
    }
}
