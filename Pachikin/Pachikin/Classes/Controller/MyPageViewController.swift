
import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var target: UIImageView!
    @IBOutlet weak var closeEyeView: UIView!
    @IBOutlet weak var parentCloseEyeVIew: UIView!
    @IBOutlet weak var openEyeView: UIImageView!
    @IBOutlet weak var conditionTitle1: UILabel!
    @IBOutlet weak var conditionTitle2: UILabel!
    @IBOutlet weak var conditionTitle3: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var limitedDays: UILabel!
    @IBOutlet weak var statusTextLabel: UILabel!
    @IBOutlet weak var remainText1: UILabel!
    @IBOutlet weak var remainText2: UILabel!
    @IBOutlet weak var remainDays: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        target.layer.cornerRadius = 50
        target.layer.masksToBounds = true
    }
    
    @IBAction func test(_ sender: Any) {
        openEye()
    }
    func openEye(){
        closeEyeView.layer.anchorPoint = CGPoint(x:0.5, y:0)
        parentCloseEyeVIew.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -closeEyeView.layer.bounds.height/2, 0)
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform")
        animation.duration = 1.0
        animation.repeatCount = 1
        animation.autoreverses = false
        let transform : CATransform3D = CATransform3DMakeRotation(CGFloat(Double.pi),  1.0, 0.0, 0.0)
        animation.toValue = NSValue(caTransform3D : transform)
        closeEyeView.layer.add(animation, forKey: "transform")
        
        statusTextLabel.text = "監視中..."
        UIView.animate(withDuration: 1.0, animations: {
            self.parentCloseEyeVIew.alpha = 0.0
            self.openEyeView.alpha = 1.0
            self.target.alpha = 1.0
            self.remainText1.alpha = 1.0
            self.remainText2.alpha = 1.0
            self.remainDays.alpha = 1.0
            self.conditionTitle1.alpha = 1.0
            self.conditionTitle2.alpha = 1.0
            self.conditionTitle3.alpha = 1.0
            self.days.alpha = 1.0
            self.money.alpha = 1.0
            self.limitedDays.alpha = 1.0
        })
    }
}
