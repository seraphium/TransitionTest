//
//  NewsItem.swift
//  TransitionTest
//
//  Created by Jackie Zhang on 2016/10/7.
//  Copyright © 2016年 Jackie Zhang. All rights reserved.
//

import Foundation

class NewsItem: NSObject, NSCoding {
    
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

    
    init(dict: [String: AnyObject]) {
        super.init()
        title = dict["title"] as? String
        date = dict["date"] as? String
        author_name = dict["author_name"] as? String
        thumbnail_pic_s = dict["thumbnail_pic_s"] as? String
        thumbnail_pic_s02 = dict["thumbnail_pic_s02"] as? String
        thumbnail_pic_s03 = dict["thumbnail_pic_s03"] as? String
        url = dict["url"] as? String
        uniquekey = dict["uniquekey"] as? String
        type = dict["type"] as? String
        realtype = dict["realtype"] as? String

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        title = aDecoder.decodeObject(forKey: "title") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
        author_name = aDecoder.decodeObject(forKey: "author_name") as? String
        thumbnail_pic_s = aDecoder.decodeObject(forKey: "thumbnail_pic_s") as? String
        thumbnail_pic_s02 = aDecoder.decodeObject(forKey: "thumbnail_pic_s02") as? String
        thumbnail_pic_s03 = aDecoder.decodeObject(forKey: "thumbnail_pic_s03") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        uniquekey = aDecoder.decodeObject(forKey: "uniquekey") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        realtype = aDecoder.decodeObject(forKey: "realtype") as? String
        
       
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(author_name, forKey: "author_name")
        aCoder.encode(thumbnail_pic_s, forKey: "thumbnail_pic_s")
        aCoder.encode(thumbnail_pic_s02, forKey: "thumbnail_pic_s02")
        aCoder.encode(thumbnail_pic_s03, forKey: "thumbnail_pic_s03")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(uniquekey, forKey: "uniquekey")
        aCoder.encode(type, forKey: "type")
        aCoder.encode(realtype, forKey: "realtype")

        
        

    }
}
