//
//  MastodonData.swift
//  Mastodon
//
//  Created by aseo on 2019/02/26.
//  Copyright © 2019年 YMoku. All rights reserved.
//

import Foundation

/// MastodonのAPIから返されるデータ
public struct MastodonData: Decodable {
    /// イベントの種類
    public var event: String
    /// データ内容
    public var payload: String
}
