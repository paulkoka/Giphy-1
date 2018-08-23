//
//  GiphyData.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

struct GiphyData: Codable {
    let dataId: String?
    let title: String?
    let rating: String?
    let importDatetime: String?
    let trendingDatetime: String?
    let image: GiphyImage?
    
    enum CodingKeys: String, CodingKey {
        case title, rating
        case dataId = "id"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case image = "images"
    }
}
