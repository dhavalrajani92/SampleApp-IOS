//
//  Model.swift
//  SampleApp
//
//  Created by Dhaval Rajani on 31/01/22.
//

struct Model: Decodable {
  var userId: String
  var id: String
  var title: String
 
  
  enum CodingKeys: String, CodingKey {
    case userId
    case id
    case title
  }
}
