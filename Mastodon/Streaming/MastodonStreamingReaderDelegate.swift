//
//  MastodonStreamingReaderDelegate.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// MastodonのストリーミングAPIとの通信結果を取得するためのデリゲート
public protocol MastodonStreamingReaderDelegate: class {
    /// ストリームAPIへの接続開始時
    func connected()
    /// ストリームAPIへの接続切断時
    ///
    /// - Parameter error: 接続切断時に生じたエラー
    func disConnected(error: Error?)
    /// ストリームAPIから取得できた情報
    func didReceived(data: MastodonData)
    /// ストリームAPIとのやり取り中に何らかの処理で失敗した
    func didFailure(error: Error)
}
