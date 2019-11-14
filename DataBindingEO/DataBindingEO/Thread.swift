//
//  Thread.swift
//  DataBindingEO
//
//  Created by mcs on 11/11/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

class Thread {
  var name: String
  var posts: [Post]
}

class Post {
  var body: String
  var likeCount: Int
}
