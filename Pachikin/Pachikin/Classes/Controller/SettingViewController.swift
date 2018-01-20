
import UIKit
import Eureka

class SettingViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
            +++ SwitchRow(){
                $0.title = "監視モード"
                }.onCellSelection({ (cell, row) in
                    
                })
            <<< LabelRow(){
                $0.title = "リセット"
                }.onCellSelection{ (cell, row) in
                    self.resetAlert()
                }.cellSetup { cell, row in
                    cell.textLabel?.textColor = .red
            }
            +++ Section(){ section in
                var header = HeaderFooterView<UILabel>(.class)
                header.height = { 44 }
                header.onSetupView = {view, _ in
                    view.text = "登録情報"
                    view.font = UIFont.systemFont(ofSize: 15)
                }
                section.header = header
            }
            <<< IntRow(){
                $0.title = "平均投資額（円/日）"
                }.onChange({ (row) in
                    //save realm.
                })
            <<< IntRow(){
                $0.title = "パチンコに行く日数（日/週）"
                }.onChange({ (row) in
                    //save realm.
                })
            <<< IntRow(){
                $0.title = "制限日数（日）"
                }.onChange({ (row) in
                    //save realm.
                })
    }
    
    func resetAlert(){
        let alert: UIAlertController = UIAlertController(title: "リセットしますか？", message: "一度リセットした情報は戻すことができません。", preferredStyle:  UIAlertControllerStyle.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "はい", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "いいえ", style: UIAlertActionStyle.cancel, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
