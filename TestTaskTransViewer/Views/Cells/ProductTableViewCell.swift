//
//  ProductTableViewCell.swift
//  TestTaskTransViewer
//
//  Created by Vladimir Eryshev on 11.07.2025.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {

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
    
    func configure(with item: Product) {
        titleLabel.text = item.name
        descriptionLabel.text = "\(item.transactions.count) transactions \u{203A}"
    }
}
