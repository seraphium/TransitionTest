//
//  NewsItem.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 2016/10/7.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import Foundation
import HandyJSON

struct NewsItem : HandyJSON{
    
    var title: String?
    
    var date: String?
    
    var author_name: String?
    
    var thumbnail_pic_s: String?
    
    var thumbnail_pic_s02: String?
    
    var thumbnail_pic_s03: String?

    var url: String?
    
    var uniquekey: String?

    var type: String?

    var realtype: String?

}

struct Result : HandyJSON{
    var stat: String?
    var data: [NewsItem]?
}
