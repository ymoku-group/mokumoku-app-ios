//
//  ViewController.swift
//  mokumoku-app-ios
//
//  Created by aseo on 2019/02/25.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import UIKit
import Mastodon

class ViewController: UIViewController {
    /// マストドン
    var mastodonStreamReader: MastodonStreamingReader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mastodonStreamReader = MastodonStreamingReader(domain: "mstdn.jp",
                                                       accessToken: "8735c4c8d85a51c57be9834594fc3af7e5ea55eb5ff7452f516aa2287d3773f5",
                                                       delegate: self)
        mastodonStreamReader?.on(streamingType: .hashtag, tag: "ワイもく".urlEncoded)
    }
}

extension ViewController: MastodonStreamingReaderDelegate {
    func connected() {
        print("connected")
    }
    
    func disConnected(error: Error?) {
        print("disConnected")
    }
    
    func didReceived(data: MastodonData) {
        print(data.payload)
    }
    
    func didFailure(error: Error) {
        print("didFailure")
    }
}

