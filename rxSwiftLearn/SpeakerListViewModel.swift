//
//  SpeakerListViewModel.swift
//  rxSwiftLearn
//
//  Created by 刘大维 on 2018/8/2.
//  Copyright © 2018年 刘大维. All rights reserved.
//

import Foundation
import RxSwift

struct SpeakerListViewModel {
    let data = Observable.just([
        Speaker(name: "Ben Sandofsky", twitterHandle: "@sandofsky"),
        Speaker(name: "Carla White", twitterHandle: "@carlawhite"),
        Speaker(name: "Jaimee Newberry", twitterHandle: "@jaimeejaimee"),
        Speaker(name: "Natasha Murashev", twitterHandle: "@natashatherobot"),
        Speaker(name: "Robi Ganguly", twitterHandle: "@rganguly"),
        Speaker(name: "Virginia Roberts",  twitterHandle: "@askvirginia"),
        Speaker(name: "Scott Gardner", twitterHandle: "@scotteg")
    ])
}
