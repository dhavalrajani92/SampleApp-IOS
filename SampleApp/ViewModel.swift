//
//  ViewModel.swift
//  SampleApp
//
//  Created by Dhaval Rajani on 31/01/22.
//

final class ViewModel {
  init() {}
  
  var data: [Model]? = nil
  
  func fetchData(successHandler: @escaping ()-> Void, errorHandler: @escaping (_ message: String?)->Void) {
    APIService<Model>.getComments(path: "/planetary/apod", resultType: Model.self) { result in
      switch result {
      case .success(let data):
        self.data = data
        successHandler()
      case .failure(let error):
        self.data = [
          Model(userId: "123", id: "123", title: "Test"),
          Model(userId: "124", id: "124", title: "Test1"),
          Model(userId: "125", id: "125", title: "Test2")
        ]
        errorHandler(error.message)
      }
    }
  }
  
  
  var numberOfData: Int {
    return data?.count ?? 0
  }
  
  
}
