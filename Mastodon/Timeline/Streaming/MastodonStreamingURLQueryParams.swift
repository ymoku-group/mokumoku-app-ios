//
//  MastodonStreamingURLQueryParams.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// ストリーミングAPIのクエリーパラメータ名一覧
enum MastodonStreamingURLQueryParams: String {
    /// ストリーム
    case stream = "stream"
    /// ハッシュタグ
    case tags = "tag"
}
