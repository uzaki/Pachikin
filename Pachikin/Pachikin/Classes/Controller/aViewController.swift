//
//  1ViewController.swift
//  Pachikin
//
//  Created by uzaki kota on 2018/01/20.
//  Copyright © 2018年 uzaki kota. All rights reserved.
//

import UIKit
import AVFoundation

class aViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var dengerView: UIImageView!
    @IBOutlet weak var roundMenu: UIView!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    var audioPlayer:AVAudioPlayer!
    var moving = false
    var menuAppere = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundMenu.layer.cornerRadius = 30
        roundMenu.layer.masksToBounds = true
        eyeButton.isHidden = true
        settingButton.isHidden = true
        twitterButton.isHidden = true
        // 再生する audio ファイルのパスを取得
        let audioPath = Bundle.main.path(forResource: "Warning", ofType:"mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        // auido を再生するプレイヤーを作成する
        var audioError:NSError?
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch let error as NSError {
            audioError = error
            audioPlayer = nil
        }
        
        // エラーが起きたとき
        if let error = audioError {
            print("Error \(error.localizedDescription)")
        }
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alarmOn(_ sender: Any) {
        if ( audioPlayer.isPlaying ){
            audioPlayer.stop()
        }
        else{
            audioPlayer.play()
        }
        if moving{
            dengerView.isHidden = true
            dengerView.layer.removeAllAnimations()
            dengerView.alpha = 1.0
            moving = false
        }else{
            dengerView.isHidden = false
            UIView.animate(withDuration: 1.0, delay: 0.0,options: UIViewAnimationOptions.repeat, animations: { () -> Void in
                self.dengerView.alpha = 0.0
            }, completion: nil)
            moving = true
        }
    }
    @IBAction func settingButtonTap(_ sender: Any) {
        roundMenuDissAppear()
    }
    
    @IBAction func eyeButtonTap(_ sender: Any) {
        roundMenuDissAppear()
    }
    
    @IBAction func twitterTap(_ sender: Any) {
        roundMenuDissAppear()
    }
    
    @IBAction func roundMenuTap(_ sender: Any) {
        if menuAppere{
            roundMenuDissAppear()
        }else{
            roundMenuAppear()
        }
    }
    
    func roundMenuDissAppear(){
        UIView.animate(withDuration: 0.2, animations: {
            self.roundMenu.transform = CGAffineTransform.identity
            self.eyeButton.isHidden = true
            self.settingButton.isHidden = true
            self.twitterButton.isHidden = true
        })
        menuAppere = false
    }
    
    func roundMenuAppear(){
        UIView.animate(withDuration: 0.2, animations: {
            self.roundMenu.transform = CGAffineTransform.init(scaleX: 5, y: 5)
            self.eyeButton.isHidden = false
            self.settingButton.isHidden = false
            self.twitterButton.isHidden = false
        })
        menuAppere = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func returnHomeView(segue: UIStoryboardSegue) {}

}
