//
//  EmojiCollectionViewController.swift
//  MyLabEmojiDictionaryPart3
//
//  Created by 曹家瑋 on 2023/11/16.
//

/*
import UIKit

/// 使用reuseIdentifier來標識collectionViewCell
private let reuseIdentifier = "ItemCell"

class EmojiCollectionViewController: UICollectionViewController {
    
    /// 包含Emoji類別實例的陣列
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "微笑臉", description: "一個典型的微笑臉。", usage: "快樂"),
        Emoji(symbol: "😕", name: "困惑臉", description: "一個困惑、不解的臉。", usage: "不確定該怎麼想；不悅"),
        Emoji(symbol: "😍", name: "愛心眼睛", description: "眼睛是愛心的微笑臉。", usage: "對某事物的喜愛；吸引力"),
        Emoji(symbol: "🧑‍💻", name: "開發者", description: "一個正在使用MacBook的人（可能在使用Xcode用Swift寫iOS應用）。", usage: "應用、軟體、程式"),
        Emoji(symbol: "🐢", name: "烏龜", description: "一隻可愛的烏龜。", usage: "某事物緩慢"),
        Emoji(symbol: "🐘", name: "大象", description: "一隻灰色的大象。", usage: "良好的記憶力"),
        Emoji(symbol: "🍝", name: "義大利麵", description: "一盤義大利麵。", usage: "義大利麵"),
        Emoji(symbol: "🎲", name: "骰子", description: "一顆骰子。", usage: "冒險、機會；遊戲"),
        Emoji(symbol: "⛺️", name: "帳篷", description: "一頂小帳篷。", usage: "露營"),
        Emoji(symbol: "📚", name: "書堆", description: "三本彩色書籍堆疊在一起。", usage: "家庭作業、學習"),
        Emoji(symbol: "💔", name: "破碎的心", description: "一顆紅色的破碎心。", usage: "極度悲傷"),
        Emoji(symbol: "💤", name: "打呼", description: "三個藍色的「z」。", usage: "疲倦、想睡"),
        Emoji(symbol: "🏁", name: "終點旗", description: "一面黑白格子旗。", usage: "完成")
    ]
    
    struct PropertyKeys {
        /// 用於存儲 segue id
        static let saveUnwind = "saveUnwind"
    }
    
    @IBOutlet weak var layoutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 每次視圖即將出現時，重新載入集合視圖數據
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    @IBAction func switchLayouts(_ sender: UIBarButtonItem) {
    }


    // MARK: - UICollectionViewDataSource
    // 設定collectionView的section數量
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // 設定每個section的項目數量
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }

    // 設定collectionView每個單元格的內容
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EmojiCollectionViewCell else {
            fatalError("Unable to dequeue EmojiCollectionViewCell")
        }
        
        let emoji = emojis[indexPath.item]
        cell.update(with: emoji)
    
        return cell
    }
    
    // 設定從EmojiCollectionViewController到AddEditEmojiTableViewController的segue動作
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            // 編輯
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            // 新增
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    // 從 AddEditEmojiTableViewController 返回時的動作
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == PropertyKeys.saveUnwind,
              let sourceViewController = segue.source as? AddEditEmojiTableViewController,
              let emoji = sourceViewController.emoji else { return }
    }

    // MARK: - UICollectionViewDelegate
    // 設置每個項目的選單配置
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (elements) -> UIMenu? in
            let delete = UIAction(title: "刪除") { (action) in
                self.deleteEmoji(at: indexPath)
            }
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: [delete])
        }
        
        return config
    }
    
    /// 刪除指定位置的Emoji
    func deleteEmoji(at indexPath: IndexPath) {
        
    }

}
*/


// MARK: - 修改部分

import UIKit

// MARK: - Constants
/// 使用reuseIdentifier標示ItemCell
private let reuseIdentifier = "ItemCell"
/// 使用columnReuseIdentifier標示ColumnItemCell
private let columnReuseIdentifier = "ColumnItemCell"

/// 用於在「註冊」和「重用」頭部視圖時作為標識符號
private let headerIdentifier = "Header"
/// 在集合視圖中用來「區分」不同種類的補充視圖（例如頭部視圖）
private let headerKind = "header"


// MARK: - EmojiCollectionViewController
class EmojiCollectionViewController: UICollectionViewController {
    
    /// 切換collectionView顯示型態
    @IBOutlet weak var layoutButton: UIBarButtonItem!
    
    // MARK: - Properties
    /// 包含Emoji類別實例的陣列
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
        Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
    
    struct PropertyKeys {
        /// 用於存儲 segue id
        static let saveUnwind = "saveUnwind"
    }
    
    /// 分區資料的陣列
    var sections: [Section] = []
    
    /// 切換佈局的Enum
    enum Layout {
        case grid
        case column
    }
    
    /// 用來保存集合視圖的布局配置
    var layout: [Layout: UICollectionViewLayout] = [:]
    
    /// 用來儲存目前的布局類型。預設為 .grid（網格布局）。
    var activeLayout: Layout = .grid {
        didSet {
            if let layout = layout[activeLayout] {
                // 根據目前的布局類型，重新載入視圖中可見的項目。
                self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
                
                // 將集合視圖的布局切換到新的布局，並使用動畫效果。
                collectionView.setCollectionViewLayout(layout, animated: true) { (_) in
                    // 切換完成後，根據目前的布局類型，更新layoutButton圖示。
                    switch self.activeLayout {
                    case .grid:
                        self.layoutButton.image = UIImage(systemName: "rectangle.grid.1x2")
                    case .column:
                        self.layoutButton.image = UIImage(systemName: "square.grid.2x2")
                    }
                }
            }
        }
    }
    
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 註冊自定義的 header，供 collectionView 使用
        collectionView.register(EmojiCollectionViewHeader.self, forSupplementaryViewOfKind: headerKind, withReuseIdentifier: headerIdentifier)

        // 初始化「布局字典」，設定不同的布局模式。
        layout[.grid] = generateGridLayout()
        layout[.column] = generateColumnLayout()
        
        // 根據目前設定的 activeLayout（默認是網格布局），選擇相應的布局並設置給集合視圖。
        if let layout = layout[activeLayout] {
            collectionView.collectionViewLayout = layout
        }
    }
    
    // 每次視圖即將出現時，重新載入集合視圖數據
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateSections()
        collectionView.reloadData()
    }
    
    
    // MARK: - Layout Switching
    // 切換布局的功能
    @IBAction func switchLayouts(_ sender: UIBarButtonItem) {
        // 依據目前的 activeLayout，切換到另一種布局。
        switch activeLayout {
        case .grid:
            activeLayout = .column
        case .column:
            activeLayout = .grid
        }
    }
    
    // MARK: - Layout Generation
    /// 格列佈局
    func generateColumnLayout() -> UICollectionViewLayout {
        /// 設定元素間的間距
        let padding: CGFloat = 10
        
        /// 創建布局項目
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        /// 創建水平布局群組
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(120)
            ),
            subitem: item,
            count: 1
        )
        
        // 設置群組內邊距
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding )
        
        /// 建立布局區段，設定區段之間的間隔，及設定區段的頂部和底部設定 padding 邊界。
        let secion = NSCollectionLayoutSection(group: group)
        secion.interGroupSpacing = padding
        secion.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: 0, bottom: padding, trailing: 0)
        
        secion.boundarySupplementaryItems = [generateHeader()]
        
        return UICollectionViewCompositionalLayout(section: secion)
    }
    
    /// 生成網格布局
    func generateGridLayout() -> UICollectionViewLayout {
        /// 設定元素間的間距
        let padding: CGFloat = 20
        
        /// 創建布局項目
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
        )
        
        /// 創建水平布局群組
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1/4)
            ),
            subitem: item,
            count: 2         // 每行顯示2個項目
        )
        
        // 為群組設置間距和內邊距
        group.interItemSpacing = .fixed(padding)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
        
        // 用這個群組創建一個NSCollectionLayoutSection，設置群組間的間距，並調整上下的內邊距。
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = padding
        section.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: 0, bottom: padding, trailing: 0)
        
        section.boundarySupplementaryItems = [generateHeader()]
        
        // 回傳基於這個新部分的 UICollectionViewCompositionalLayout
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    /// 生成集合視圖Header的配置。
    func generateHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        // 建立 NSCollectionLayoutBoundarySupplementaryItem，用於集合視圖的Header。
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(40)
            ),
            elementKind: headerKind,
            alignment: .top
        )
        
        // 啟用將Header固定到視圖可見邊界的效果。
        header.pinToVisibleBounds = true
        return header
    }
  
    // MARK: - Section Management
    /// 更新分區
    func updateSections() {
        sections.removeAll()
        
        /// 根據 sectionTitle 將 emojis 分組
        let grouped = Dictionary(grouping: emojis, by: { $0.sectionTitle })
        
        // 對分組後的數據進行排序，並建立新的 sections
        for (title, emojis) in grouped.sorted(by: { $0.0 < $1.0 }) {
            sections.append(
                Section(title: title,
                        emojis: emojis.sorted(by: { $0.name < $1.name })
                )
            )
        }
    }
    
    // MARK: - Emoji Handling
    /// 用於找出某個特定 Emoji 在集合視圖中的位置
    func indexPath(for emoji: Emoji) -> IndexPath? {
        // 首先，在 sections 陣列中尋找包含該 emoji 的分區
        if let sectionIndex = sections.firstIndex(where: { $0.title == emoji.sectionTitle }),
           // 接著，在該分區中找到該 emoji 的索引
           let index = sections[sectionIndex].emojis.firstIndex(where: { $0 == emoji })
        {
            // 如果找到，則創建一個新的 IndexPath 並返回
            return IndexPath(item: index, section: sectionIndex)
        }
        // 如果找不到，返回 nil
        return nil
    }
    
    // MARK: - Navigation
    // 設定從EmojiCollectionViewController到AddEditEmojiTableViewController的segue動作
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell) {
            // 編輯
            let emojiToEdit = sections[indexPath.section].emojis[indexPath.item]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            // 新增
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    
    // 從 AddEditEmojiTableViewController 返回時的動作
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        // 確保segue是saveUnwind，並且可以取得來源控制器和emoji對象。
        guard segue.identifier == PropertyKeys.saveUnwind,
              let sourceViewController = segue.source as? AddEditEmojiTableViewController,
              let emoji = sourceViewController.emoji else { return }
        
        // 檢查是否有選中的項目並找到emoji在數據源中的索引。
        if let path = collectionView.indexPathsForSelectedItems?.first,
        let i = emojis.firstIndex(where: { $0 == emoji }) {
            // 更新數據源中的emoji並刷新對應區段。
            emojis[i] = emoji
            updateSections()
            
            // 重新加載對應的集合視圖項目。
            collectionView.reloadItems(at: [path])
        } else {
            // 如果沒有選中的項目，將新的emoji添加到數據源中。
            emojis.append(emoji)
            updateSections()
        
            // 在集合視圖中插入新的項目。
            if let newIndexPath = indexPath(for: emoji) {
                collectionView.insertItems(at: [newIndexPath])
            }
        }

    }


    // MARK: - UICollectionViewDataSource
    // 設定collectionView的section數量
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    // 設定每個section的項目數量
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].emojis.count
    }

    // 設定collectionView每個單元格的內容
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 根據目前的布局模式（網格或列布局），選擇對應的 Identifier。
        let identifier = activeLayout == .grid ? reuseIdentifier : columnReuseIdentifier
        
        // 從集合視圖的可重用池中取出一個 cell，若無法取出則觸發錯誤。
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? EmojiCollectionViewCell else {
            fatalError("Unable to dequeue EmojiCollectionViewCell")
        }
        
        let emoji = sections[indexPath.section].emojis[indexPath.item]
        cell.update(with: emoji)
    
        return cell
    }
    
    // 提供Supplementary Views，EX: Header。
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 嘗試重用一個已經存在的HeaderView
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as? EmojiCollectionViewHeader else {
            fatalError("Unable to dequeue EmojiCollectionViewHeader")
        }
        
        // 設置header標題為對應分區的標題。
        header.titleLabel.text = sections[indexPath.section].title
        
        return header
    }

    // MARK: - UICollectionViewDelegate
    // 設置每個項目的選單配置
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (elements) -> UIMenu? in
            let delete = UIAction(title: "刪除") { (action) in
                self.deleteEmoji(at: indexPath)
            }
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: [delete])
        }
        
        return config
    }
    
    /// 刪除指定位置的Emoji
    func deleteEmoji(at indexPath: IndexPath) {
        // 從sections陣列裡，根據indexPath找到要刪除的emoji
        let emoji = sections[indexPath.section].emojis[indexPath.item]
        // 尋找這個emoji在emojis陣列中的位置
        guard let index = emojis.firstIndex(where: { $0 == emoji }) else { return }
        
        // 從emojis陣列中刪除找到位置的emoji
        emojis.remove(at: index)
        // 在sections的對應部分也刪除這個emoji
        sections[indexPath.section].emojis.remove(at: indexPath.item)
        // 在collectionView中刪除這個項目
        collectionView.deleteItems(at: [indexPath])
    }

}
