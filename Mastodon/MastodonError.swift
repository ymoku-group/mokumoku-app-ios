//
//  MastodonError.swift
//  Mastodon
//
//  Created by aseo on 2019/02/27.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// Mastodonモジュールのエラードメイン
public let MastodonErrorDomain = "com.ymoku.mastodon"

/// ストリーミングAPIのURLが不正なものだった場合
public let MastodonStreamingInvalidURL = 1100
/// ストリーミングAPIから取得したデータがデコーディングできなかった場合
public let MastodonStreamingDecodingError = 1101

/// Mastodonモジュール用エラーの生成
///
/// - Parameter code: Mastodonモジュール用のエラーコード
/// - Returns: Mastodonモジュール用エラー
func mastodonError(code: Int) -> NSError {
    return NSError(domain: MastodonErrorDomain,
                   code: code,
                   userInfo: nil)
}
