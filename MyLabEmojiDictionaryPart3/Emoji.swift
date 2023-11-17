//
//  Emoji.swift
//  MyLabEmojiDictionaryPart3
//
//  Created by 曹家瑋 on 2023/11/16.
//

/*
import Foundation

struct Emoji: Codable, Equatable {
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.symbol == rhs.symbol
    }
}

*/

// MARK: - 修改後

import Foundation

/// 用於儲存emoji相關的數據。
struct Emoji: Codable, Equatable {
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    /// 用於提取Emoji名稱的首字母作為分區標題。如果找不到首字母，則使用"?"。
    var sectionTitle: String {
        String(name.uppercased().first ?? "?")
    }
    
    // 用於比較兩個Emoji實例是否相同。比較依據是它們的符號。
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.symbol == rhs.symbol
    }
}

/// 用於儲存「每個分區」的「標題」和「其下的Emoji數據」。
struct Section: Codable {
    /// 分區的標題
    var title: String
    /// 該分區下的Emoji數據
    var emojis: [Emoji]
}
