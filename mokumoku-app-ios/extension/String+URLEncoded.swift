//
//  String+URLEncoded.swift
//  mokumoku-app-ios
//
//  Created by aseo on 2019/02/27.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

extension String {
    /// URLエンコードされた文字列を取得する
    ///
    /// [ロジック掲載元](https://dev.classmethod.jp/smartphone/iphone/urlencode-spec-and-implementation-for-swift/)
    var urlEncoded: String {
        // 半角英数字 + "/?-._~" のキャラクタセットを定義
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        // 一度すべてのパーセントエンコードを除去(URLデコード)
        let removed = removingPercentEncoding ?? self
        // あらためてパーセントエンコードして返す
        return removed.addingPercentEncoding(withAllowedCharacters: charset) ?? removed
    }
}
