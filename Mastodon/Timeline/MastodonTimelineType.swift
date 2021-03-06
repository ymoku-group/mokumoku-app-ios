//
//  MastodonStreamType.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// MastodonのTinelineAPIで流れてくるデータの種類
/// - seealso:
/// [Mastodon: API overview#Timelines](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md#timelines)
public enum MastodonTimelineType: String {
    /// 連合タイムライン
    case federated = "public"
    /// 連合タイムラインのメディアのみ表示
    case federatedMediaOnly = "public:media"
    /// ローカルタイムライン
    case local = "public:local"
    /// ユーザのタイムラインと通知
    case user = "user"
    /// ユーザへの通知
    case userNotification = "user:notification"
    /// ハッシュタグ
    case hashtag = "hashtag"
    /// ローカルタイムラインのクエリータグで指定した
    case hashtagLocal = "hashtag:local"
    /// ユーザへのダイレクトメッセージ
    case direct = "direct"
    /// クエリーリストで指定した自分のリスト
    case list = "list"
}
