import UIKit

extension UIColor {
    static func fromHex(_ hex: UInt64) -> UIColor {
        return UIColor(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255,
            blue: CGFloat(hex & 0x0000FF) / 255,
            alpha: 1
        )
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var funnyButton: UIButton!
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    
    lazy var allViews = [view1, view2, view3, view4, view5, view6, view7, view8, view9, view10, view11]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyRandomViewsColorsAndRadiuses(animated: false)
    }
    
    @IBAction func funnyButton(_ sender: UIButton) {
        sender.isEnabled = false
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()
        
        applyRandomViewsColorsAndRadiuses(animated: true) {
            sender.isEnabled = true
        }
    }

    func generateRandomHex() -> UInt64 {
        return .random(in: 0...0xFFFFFF)
    }

    func applyRandomViewsColorsAndRadiuses(animated: Bool, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: animated ? 0.5 : 0.0, animations: {
            for view in self.allViews {
                view?.backgroundColor = UIColor.fromHex(self.generateRandomHex())
                view?.layer.cornerRadius = .random(in: 0...CGFloat.minimum(view!.frame.height, view!.frame.width) / 2)
            }
        }, completion: { _ in
            completion?()
        })
    }
}
