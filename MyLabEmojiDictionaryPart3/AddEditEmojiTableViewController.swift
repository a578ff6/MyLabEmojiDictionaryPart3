//
//  AddEditEmojiTableViewController.swift
//  MyLabEmojiDictionaryPart3
//
//  Created by 曹家瑋 on 2023/11/16.
//

import UIKit

// 用於新增或編輯表情符號
class AddEditEmojiTableViewController: UITableViewController {

    // MARK: - Outets
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: - Properties
    struct PropertyKeys {
        /// 儲存時的 Unwind Segue id
        static let saveUnwind = "saveUnwind"
    }
    
    /// Emoji 可為 nil，表示當前正在新增或編輯的表情符號
    var emoji: Emoji?
    
    init?(coder: NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 如果正在編輯現有 Emoji，則將其屬性載入到輸入框中
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState() // 更新儲存按鈕的啟用狀態
    }
    
    
    // MARK: - Actions
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()  // 當「輸入框內容變更」時，更新儲存按鈕狀態
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 準備執行 Segue 前的設置
        guard segue.identifier == PropertyKeys.saveUnwind else { return }
        // 從輸入框中獲取表情符號資訊，並創建或更新 Emoji 實例
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    }
    
    // MARK: - Private Methods
    // 更新儲存按鈕的啟用狀態
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        saveButton.isEnabled = containsSingleEmoji(symbolTextField) && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    // 檢查輸入框中是否只包含單個表情符號
    func containsSingleEmoji(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count == 1 else {
            return false
        }
        
        let isEmoji = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        
        return isEmoji
    }


}

