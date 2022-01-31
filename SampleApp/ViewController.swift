//
//  ViewController.swift
//  SampleApp
//
//  Created by Dhaval Rajani on 31/01/22.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  private let viewModel = ViewModel()
  private var data: [Model]? = nil
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    // Do any additional setup after loading the view.
    viewModel.fetchData(successHandler: {
      self.setupView()
    }) { message in
      // display error
      self.setupView()
    }
  }
  
  private func setupView() {
    DispatchQueue.main.async {
      self.tableView.delegate = self
      self.tableView.dataSource = self
      
      self.tableView.reloadData()
    }
    
  }
  
  private func registerNibs() {
    tableView.register(MyCustomCell.self, forCellReuseIdentifier: MyCustomCell.identifier)
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfData
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let data = viewModel.data?[indexPath.row], let cell = tableView.dequeueReusableCell(withIdentifier: MyCustomCell.identifier) as? MyCustomCell else {
      return UITableViewCell()
    }
    cell.render(userId: data.userId, title: data.title, id: data.id)
    return cell
  }
  
  
}


