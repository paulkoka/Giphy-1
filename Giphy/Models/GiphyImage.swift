//
//  GiphyImage.swift
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

import Foundation

struct GiphyImage: Codable {
    let original: GiphyImageMeta?
    let preview: GiphyImageMeta?
    
    enum CodingKeys: String, CodingKey {
        case original = "original"
        case preview = "preview_gif"
    }
}
