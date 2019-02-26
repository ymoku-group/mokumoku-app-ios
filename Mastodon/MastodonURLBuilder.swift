//
//  MastodonURLBuilder.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// マストドンのAPIにアクセスする際に必要なURLを用意する
protocol MastodonURLBuilder {
    /// ドメイン
    var domain: String { get }
    /// APIのバージョン
    var apiVersion: Int { get }
    /// アクセストークン
    var accessToken: String { get }
    /// APIのアクセス先URLを返す
    ///
    /// - Parameter params: クエリパラメータ
    /// - Returns: APIのアクセス先URL
    func url(params: [String:String]?) -> URL?
}
