//
//  NewsModel.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import Foundation

struct NewsModel: Codable, Identifiable {
    let id = UUID()
    var hits : [Hits]?
}
struct Hits: Codable, Identifiable {
    let id = UUID()
    var title : String?
    var URL : String?
    var point : Int?
}
