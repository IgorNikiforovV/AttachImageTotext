//
//  ViewController.swift
//  AttachImageTotext
//
//  Created by Игорь Никифоров on 18.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.isEditable = false
        textView.textAlignment = .left
        textView.attributedText = Const.textBlock1
    }

}

extension ViewController {

    enum Const {

        static var textBlock1: NSMutableAttributedString {
            let text1 =  "\thow much does it cost to suspend"
            let text2 =  "Basic services"
            let text3 =  "Internet, TV, Telephony — 20$ / month for one"
            let text4 =  "Additional services -"
            let text5 =  "free."

            let completeText = NSMutableAttributedString(string: "")

            completeText.append(Const.image)
            completeText.append(NSAttributedString(string: text1, attributes: Const.regularAttributes))
            completeText.append(NSAttributedString(string: text2, attributes: Const.boldAttributes))
            completeText.append(NSAttributedString(string: text3, attributes: Const.regularAttributes))
            completeText.append(NSAttributedString(string: text4, attributes: Const.boldAttributes))
            completeText.append(NSAttributedString(string: text5, attributes: Const.regularAttributes))

            completeText.enumerateAttributes(in: NSMakeRange(0, completeText.string.count), options: []) { (attribute, range, stop) -> Void in
                if attribute.keys.contains(.font) {
                    completeText.addAttributes(
                        [.paragraphStyle : Const.paragraphStyle],
                        range: NSMakeRange(range.lowerBound - 1, range.length))
                }
            }

            return completeText
        }

        static var regularAttributes: [NSAttributedString.Key: Any] {
            return [.font: UIFont.systemFont(ofSize: 15),
                    .foregroundColor : UIColor.black]
        }

        static var boldAttributes: [NSAttributedString.Key: Any] {
            return [.font: UIFont.boldSystemFont(ofSize: 15),
                    .foregroundColor : UIColor.black]
        }

        static var paragraphStyle: NSMutableParagraphStyle {
            let indentation: CGFloat = 20
            let lineSpacing: CGFloat = 2
            let paragraphSpacing: CGFloat = 2
            let paragraphStyle = NSMutableParagraphStyle()
            let nonOptions = [NSTextTab.OptionKey: Any]()
            paragraphStyle.tabStops = [
                NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
            paragraphStyle.defaultTabInterval = indentation
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.paragraphSpacing = paragraphSpacing
            paragraphStyle.headIndent = indentation
            return paragraphStyle
        }

        static var image: NSAttributedString {
            let image1Attachment = NSTextAttachment()
            image1Attachment.image = UIImage(named: "greenCheckMark")
            image1Attachment.bounds = CGRect(x: 0, y: -5, width: image1Attachment.image!.size.width,
                                            height: image1Attachment.image!.size.height)
            let image1String = NSAttributedString(attachment: image1Attachment)
            return image1String
        }

    }


}

