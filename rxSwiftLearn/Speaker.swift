//
//  Speaker.swift
//  rxSwiftLearn
//
//  Created by 刘大维 on 2018/8/2.
//  Copyright © 2018年 刘大维. All rights reserved.
//

import UIKit

struct Speaker {
    let name: String
    let twitterHandle: String
    var image: UIImage?

    init(name: String, twitterHandle: String) {
        self.name = name
        self.twitterHandle = twitterHandle
        image = UIImage(named: name)
    }
}

extension Speaker: CustomStringConvertible {
    var description: String {
        return "\(name) \(twitterHandle)"
    }
}
