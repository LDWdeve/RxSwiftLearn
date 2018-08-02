//
//  ViewController.swift
//  rxSwiftLearn
//
//  Created by 刘大维 on 2018/7/27.
//  Copyright © 2018年 刘大维. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

//        let disposeBag = DisposeBag()

//        Observable<String>.just("🔴")
//            .subscribe(Ob)
//            .disposed(by: disposeBag)


        let neverO = Observable<String>.never()

        neverO.subscribe { (event : Event<String>) in
            print(event)
        }.disposed(by: disposeBag)







        fdslajfdla

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

