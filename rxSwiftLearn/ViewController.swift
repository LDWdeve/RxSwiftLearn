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

    @IBOutlet weak var speakerListTableView: UITableView!

    let speakerListViewModel = SpeakerListViewModel()
     let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        speakerListTableView.register(UITableViewCell.self, forCellReuseIdentifier:"SpeakerCell")

        speakerListViewModel.data
            .bind(to: speakerListTableView.rx.items(cellIdentifier: "SpeakerCell")){ _, speaker, cell in
                cell.textLabel?.text = speaker.name
                cell.detailTextLabel?.text = speaker.twitterHandle
                cell.imageView?.image = speaker.image
            }
            .disposed(by: disposeBag)

        speakerListTableView.rx.modelSelected(Speaker.self).subscribe(onNext: { speaker in
            print("You selected \(speaker)")
        }).disposed(by: disposeBag)

        //just
        Observable.just(32)
            .subscribe {
                print($0)
        }.disposed(by: disposeBag)

        Observable.just(12).subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)

        Observable.of(1, 2, 3, 4, 5)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)


        let liet = BehaviorSubject(value: [7, 8, 9])
//        liet.value =
//    Variable
        liet.asObservable().subscribe(onNext: {
            print($0)
        }).disposed(by: disposeBag)

        liet.onNext([13,321,321])

        struct Person {
            var name: BehaviorRelay<String>
        }

        let scott = Person(name: BehaviorRelay(value: "liudawei"))
        let lori = Person(name: BehaviorRelay(value: "liuxiaowei"))
        let person = BehaviorRelay(value: scott)
        person.asObservable()
            .debug("person")
            .flatMap {
                $0.name.asObservable()
            }
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
        person.accept(lori)
//        person.value = lori
        scott.name.accept("eric")

//        value = "Eric"

//        /exampleOf("distinctUntilChanged") {

            let searchString = Variable("iOS")
            searchString.asObservable()
                .map { $0.lowercased() }
                .distinctUntilChanged()
                .subscribe(onNext: {
                    print($0)
                }).disposed(by: disposeBag)
            searchString.value = "IOS"
            searchString.value = "Rx"
            searchString.value = "ios"
        }

}

//extension ViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
//        return speakerListViewModel.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpeakerCell")
//            else {
//                return UITableViewCell()
//        }
//
//        let speaker = speakerListViewModel.data[indexPath.row]
//        cell.textLabel?.text = speaker.name
//        cell.detailTextLabel?.text = speaker.twitterHandle
//        cell.imageView?.image = speaker.image
//        return cell
//    }
//}
//
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You selected \(speakerListViewModel.data[indexPath.row])")
//    }
//}
