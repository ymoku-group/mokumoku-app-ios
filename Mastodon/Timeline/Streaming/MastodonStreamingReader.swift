//
//  Mastdon.swift
//  Mastodon
//
//  Created by aseo on 2019/02/25.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation
import Starscream

/// Mastodonの[ストリーミングAPI（WebSocket版）](https://github.com/tootsuite/mastodon/blob/master/streaming/index.js)にアクセスして情報を読み込むクラス
public class MastodonStreamingReader {
    /// WebSocketを行うインスタンス
    var webSocket: WebSocket?
    /// JSONデコーダー
    let jsonDecoder = JSONDecoder()
    /// ストリーミングAPIへのアクセス先URLを用意するインスタンス
    let urlBuilder: MastodonURLBuilder
    /// デリゲート
    weak var delegate: MastodonStreamingReaderDelegate?
    
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - domain: 接続先インスタンスのドメイン
    ///   - apiVersion: 接続先インスタンスのAPIバージョン
    ///   - accessToken: アクセストークン
    ///   - delegate: デリゲート
    public init?(domain: String, apiVersion: Int = 1, accessToken: String, delegate: MastodonStreamingReaderDelegate) {
        self.urlBuilder = MastodonStreamingURLBuidler(domain: domain,
                                                      apiVersion: apiVersion,
                                                      accessToken: accessToken)
        self.delegate = delegate
    }
    
    /// ストリーミングAPIからの情報を取得開始する
    ///
    /// - Parameters:
    ///   - streamType: ストリーミングの種類
    ///   - tags: タグ
    public func on(streamingType: MastodonTimelineType) {
        guard let url = urlBuilder.url(params: [MastodonStreamingURLQueryParams.stream.rawValue : streamingType.rawValue]) else {
            delegate?.didFailure(error: mastodonError(code: MastodonStreamingInvalidURL))
            return
        }
        webSocketConnect(url: url)
    }
    
    /// ストリーミングAPIからの情報を取得開始する
    ///
    /// - Parameters:
    ///   - streamType: ストリーミングの種類
    ///   - tags: タグ
    /// - attention:
    /// ストリーミングの種類が`hashtag`もしくは`hashtag:local`の時以外はタグを指定しても無視される
    public func on(streamingType: MastodonTimelineType, tag: String) {
        guard let url = urlBuilder.url(params: [MastodonStreamingURLQueryParams.stream.rawValue : streamingType.rawValue,
                                                MastodonStreamingURLQueryParams.tags.rawValue : tag]) else {
                                                    delegate?.didFailure(error: mastodonError(code: MastodonStreamingInvalidURL))
                                                    return
        }
        webSocketConnect(url: url)
    }
    
    /// ストリーミングAPIからの情報取得を停止する
    public func off() {
        webSocket?.disconnect()
    }
    
    /// WebSocketでストリーミングAPIに接続する
    ///
    /// - Parameter url: ストリーミングAPIのURL
    private func webSocketConnect(url: URL) {
        webSocket = WebSocket(url: url)
        webSocket?.onConnect = {
            self.delegate?.connected()
        }
        webSocket?.onDisconnect = { error in
            self.delegate?.disConnected(error: error)
        }
        webSocket?.onText = { text in
            guard let response = text.data(using: .utf8),
                let data = try? self.jsonDecoder.decode(MastodonData.self, from: response) else {
                    self.delegate?.didFailure(error: mastodonError(code: MastodonStreamingDecodingError))
                    return
            }
            self.delegate?.didReceived(data: data)
        }
        webSocket?.connect()
    }
}
