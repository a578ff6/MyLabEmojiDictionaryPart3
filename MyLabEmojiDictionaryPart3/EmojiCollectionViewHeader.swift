//
//  EmojiCollectionViewHeader.swift
//  MyLabEmojiDictionaryPart3
//
//  Created by 曹家瑋 on 2023/11/16.
//

import UIKit

/// 用於定義 CollectionView 中的 Header 視圖
class EmojiCollectionViewHeader: UICollectionReusableView {
    
    /// 定義一個Label，用於顯示 Header 的文字
    let titleLabel = UILabel()
    
    // 使用指定的框架大小初始化視圖
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 建立具有「模糊效果」的視圖
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        
        effect.translatesAutoresizingMaskIntoConstraints = false    // 關閉自動轉換成 Auto Layout 約束
        
        self.addSubview(effect)      // 將模糊效果視圖添加到 Header 視圖
        
        // 使用 Auto Layout 約束來定位模糊效果視圖
        NSLayoutConstraint.activate([
            effect.topAnchor.constraint(equalTo: self.topAnchor),
            effect.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            effect.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            effect.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        // 將 titleLabel 加入到模糊效果視圖的內容視圖中
        effect.contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false     // 關閉titleLabel的自動轉換成 Auto Layout 約束
        titleLabel.font = .preferredFont(forTextStyle: .headline)       // 設置 titleLabel 的字體樣式
        
        // 使用 Auto Layout 約束定位 titleLabel
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: titleLabel.superview!.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: titleLabel.superview!.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

