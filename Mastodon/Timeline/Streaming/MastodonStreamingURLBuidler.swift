//
//  WebSocketURLBuilder.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// ストリーミングAPIにアクセスする際に必要なURLを用意するクラス
class MastodonStreamingURLBuidler: MastodonURLBuilder {
    var domain: String
    var apiVersion: Int
    var accessToken: String
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - domain: 接続先インスタンスのドメイン
    ///   - apiVersion: 接続先インスタンスのAPIバージョン
    ///   - accessToken: アクセストークン
    init(domain: String, apiVersion: Int, accessToken: String) {
        self.domain = domain
        self.apiVersion = apiVersion
        self.accessToken = accessToken
    }
    
    /// ストリーミングAPIのURLを返す
    ///
    /// - Parameter params: クエリパラメータ
    /// - Returns: ストリーミングAPIのURL
    func url(params: [String : String]?) -> URL? {
        guard let stream = params?[MastodonStreamingURLQueryParams.stream.rawValue],
            let streamType = MastodonTimelineType(rawValue: stream) else {
            return nil
        }
        let urlString = "wss://\(domain)/api/v\(apiVersion)/streaming?access_token=\(accessToken)&stream=\(stream)"
        if let tag = params?[MastodonStreamingURLQueryParams.tags.rawValue],
            (streamType == .hashtag || streamType == .hashtagLocal) {
            return URL(string: "\(urlString)&tag=\(tag)")
        }
        return URL(string: urlString)
    }
}
