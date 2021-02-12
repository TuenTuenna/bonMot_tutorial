//
//  ViewController.swift
//  BonMot_Tutorial
//
//  Created by Jeff Jeong on 2021/02/12.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fifthLabel: UILabel!
    @IBOutlet var sixthLabel: UILabel!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setLabelStyle(with: "이것은 일반적인 방법으로 적용된 라벨 스타일 입니다.")
        
    }
    
    
    // 일반적인 적용 방법
    fileprivate func setLabelStyle(with content: String){
        print("ViewController - setLabelStyle() called")
        
        let attributedString = NSMutableAttributedString(string: content)
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        
        let font = UIFont.systemFont(ofSize: 72)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.red,
        ]
        
        attributedString.addAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        
        
        firstLabel.attributedText = attributedString
//        firstLabel.font = UIFont(name: "Maplestory OTF Bold", size: 20)!
        firstLabel.textColor = .black
    }


}

