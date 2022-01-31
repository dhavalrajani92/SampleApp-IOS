//
//  MyCustomCell.swift
//  SampleApp
//
//  Created by Dhaval Rajani on 31/01/22.
//

import UIKit

final class MyCustomCell: UITableViewCell {
  static var identifier = "MyCustomCell"
  
  private lazy var userIdLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  private lazy var idLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    self.contentView.addSubview(userIdLabel)
    self.contentView.addSubview(idLabel)
    self.contentView.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      userIdLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
      userIdLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
      userIdLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
      
      idLabel.leadingAnchor.constraint(equalTo: self.userIdLabel.leadingAnchor),
      idLabel.trailingAnchor.constraint(equalTo: self.userIdLabel.trailingAnchor),
      idLabel.topAnchor.constraint(equalTo: self.userIdLabel.bottomAnchor, constant: 16),
      
      titleLabel.leadingAnchor.constraint(equalTo: self.userIdLabel.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: self.userIdLabel.trailingAnchor),
      titleLabel.topAnchor.constraint(equalTo: self.idLabel.bottomAnchor, constant: 16),
      titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16)
    ])
  }
  
  func render(userId: String, title: String, id: String) {
    userIdLabel.text = userId
    titleLabel.text = title
    idLabel.text = id
  }
}
