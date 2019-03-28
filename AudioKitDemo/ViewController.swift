//
//  ViewController.swift
//  AudioKitDemo
//
//  Created by Junji Ooe on 2019/03/27.
//  Copyright © 2019 Junji Ooe. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    // ①鳴らす音ごとにAKOscillatorのインスタンスを作成する
    var oscillatorDo = AKOscillator()   // ド
    var oscillatorRe = AKOscillator()   // レ
    var oscillatorMi = AKOscillator()   // ミ
    var oscillatorFa = AKOscillator()   // ファ
    var oscillatorSo = AKOscillator()   // ソ
    var oscillatorRa = AKOscillator()   // ラ
    var oscillatorSi = AKOscillator()   // シ
    var oscillatorDo2 = AKOscillator()  // 高いド
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        // ②オシレーターごとの周波数をセット
        oscillatorDo.frequency = 523.251
        oscillatorRe.frequency = 587.330
        oscillatorMi.frequency = 659.255
        oscillatorFa.frequency = 698.456
        oscillatorSo.frequency = 783.991
        oscillatorRa.frequency = 880.000
        oscillatorSi.frequency = 987.767
        oscillatorDo2.frequency = 1046.502
        
        // ③オシレーターごとの音量をセット(1.0がデフォ？)
        oscillatorDo.amplitude = 0.5
        oscillatorRe.amplitude = 0.5
        oscillatorMi.amplitude = 0.5
        oscillatorFa.amplitude = 0.5
        oscillatorSo.amplitude = 0.5
        oscillatorRa.amplitude = 0.5
        oscillatorSi.amplitude = 0.5
        oscillatorDo2.amplitude = 0.5
        
        // ④再生準備
        // 複数のオシレーターを「kenban」にまとめて管理する
        let kenban = AKMixer(oscillatorDo, oscillatorRe, oscillatorMi, oscillatorFa, oscillatorSo, oscillatorRa, oscillatorSi, oscillatorDo2)
        // 音源を「kenban」に設定
        AudioKit.output = kenban
        // 音が鳴るようにする
        do {
            try AudioKit.start()
        } catch {
            print(error)
        }
    }
    
    func playSound(node: AKOscillator) {
        // 再生中なら停止、停止中なら再生する
        if node.isPlaying {
            node.stop()
        } else {
            node.start()
        }
    }
    @IBAction func playDo(_ sender: Any) {
        playSound(node: oscillatorDo)
    }
    
    @IBAction func playRe(_ sender: Any) {
        playSound(node: oscillatorRe)
    }
    
    @IBAction func playMi(_ sender: Any) {
        playSound(node: oscillatorMi)
    }
    
    @IBAction func playFa(_ sender: Any) {
        playSound(node: oscillatorFa)
    }
    
    @IBAction func playSo(_ sender: Any) {
        playSound(node: oscillatorSo)
    }
    
    @IBAction func playra(_ sender: Any) {
        playSound(node: oscillatorRa)
    }
    
    @IBAction func playSi(_ sender: Any) {
        playSound(node: oscillatorSi)
    }
    
    @IBAction func plauDonext(_ sender: Any) {
        playSound(node: oscillatorDo2)
    }
}
