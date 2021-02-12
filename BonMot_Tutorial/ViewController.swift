//
//  ViewController.swift
//  BonMot_Tutorial
//
//  Created by Jeff Jeong on 2021/02/12.
//

import UIKit
import BonMot


struct MyText {
    static let titleBold = StringStyle(
        .color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
        .font(UIFont(name: "BinggraeMelona-Bold", size: 25)!)
    )
    static let titleLight = StringStyle(
        .color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),
        .font(UIFont(name: "BinggraeMelona", size: 15)!)
    )
}

class ViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var fourthLabel: UILabel!
    @IBOutlet var fifthLabel: UILabel!
    @IBOutlet var sixthLabel: UILabel!
    @IBOutlet var sevenLabel: UILabel!
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setLabelStyle(with: "이것은 일반적인 방법으로 적용된 라벨 스타일 입니다.")
        setLabelStyleWithBonMot(with: "이것은 BonMot으로 적용된 라벨 스타일 입니다.")
        
        thirdLabel.attributedText = "이것은 굵은 글자 입니다.!!!!!".styled(with: MyText.titleBold)
        fourthLabel.attributedText = "이것은 일반 글자 입니다.!!!!!".styled(with: MyText.titleLight)
        
        setLabelStyleDirectly()
        setLabelStyleMultiComposed()
        setLabelWithXMLStyle()
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
        let customFont = UIFont(name: "BinggraeMelona-Bold", size: 20)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: customFont,
            .foregroundColor: UIColor.red,
        ]
        
        attributedString.addAttributes(attributes, range: NSMakeRange(0, attributedString.length))
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        firstLabel.attributedText = attributedString
        firstLabel.textColor = .black
    }

    fileprivate func setLabelStyleWithBonMot(with content: String){
        
        // 스트링 스타일 지정
        let style = StringStyle(
            .font(UIFont(name: "BinggraeMelona-Bold", size: 20)!),
            .lineSpacing(2),
//            .color(.red),
            .color(#colorLiteral(red: 1, green: 0.2607267026, blue: 0.6916279262, alpha: 1))
        )
        
        let withBackgroudStyle = style.byAdding(.backgroundColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        
        // 스타일이 지정된 어트리뷰티드 텍스트 가져온다
        secondLabel.attributedText = content.styled(with: withBackgroudStyle)
        
    }
    
    fileprivate func setLabelStyleDirectly(){
        print("ViewController - setLabelStyleDirectly() called")
        fifthLabel.numberOfLines = 0
        fifthLabel.attributedText = "이것 글자는 말이죠?!?!?! 단어 단위로 나눠진다구요요요요요요요요요요요요용?!?!?!?".styled(with: .lineBreakMode(.byWordWrapping), .alignment(.center), .color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
    }
    
    fileprivate func setLabelStyleMultiComposed(){
        let firstAttributedString = "이것은 첫번째 ".styled(with: .lineBreakMode(.byCharWrapping),
                                                      .color(.brown),
                                                      .backgroundColor(.lightGray))
        let secondAttributedString = "이건 두번째 이구요!".styled(with: MyText.titleBold)
        let thirdAttributedString = "이게 마지막 스트링입니다!!1".styled(with: MyText.titleLight)
        sixthLabel.attributedText = NSAttributedString.composed(of: [
            firstAttributedString, secondAttributedString, thirdAttributedString
        ])
    }
    
    fileprivate func setLabelWithXMLStyle(){
        let string = "one fish, two fish, <red>이건 빨간 글자!</red>,<blue>이건 파랑 글자</blue><myCustomStyle>하하하 이것은 저의 커스텀 스타일 입니다!</myCustomStyle>"
        
        let redStyle = StringStyle(.lineBreakMode(.byCharWrapping),
                                   .color(.red),
                                   .backgroundColor(.yellow)
        )
        let blueStyle = StringStyle(.underline(.single, .red),
                                   .color(.blue),
                                   .backgroundColor(.yellow)
        )
        
        let completeStyle = StringStyle(
            .font(UIFont.systemFont(ofSize: 20)),
            .lineSpacing(2),
            .xmlRules([
                .style("red", redStyle),
                .style("blue", blueStyle),
                .style("myCustomStyle", MyText.titleBold)
            ])
        )
        sevenLabel.attributedText = string.styled(with: completeStyle)
    }
}

