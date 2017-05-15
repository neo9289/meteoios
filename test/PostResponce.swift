//
//  PostResponce.swift
//  test
//
//  Created by Francesco Luise on 04/02/17.
//  Copyright © 2017 Francesco Luise. All rights reserved.
//

import UIKit

class PostResponce: NSObject {

    var userId : Int
    var id : Int
    var title : String
    var body : String
    
    init(uId : Int, postId : Int, postTitle : String, postBody : String) {
        userId = uId
        id = postId
        title = postTitle
        body = postBody
    }
    
}
