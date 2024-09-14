//
//  TodoModel.swift
//  Bloomy
//
//  Created by Heical Chandra on 27/08/24.
//


import Foundation

struct Todo: Identifiable, Decodable {
  var id: Int
  var created_at: Date
  var title: String
}
