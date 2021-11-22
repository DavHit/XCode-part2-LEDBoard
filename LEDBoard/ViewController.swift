//
//  ViewController.swift
//  LEDBoard
//
//  Created by 맥북 on 2021/11/20.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingsViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text     //현재 표시된 라벨의 텍스트를 settingViewController에 다시 전달해주기
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black     //optional, 설정된게 없으면 black으로!
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentsLabel.text = text
        }
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

