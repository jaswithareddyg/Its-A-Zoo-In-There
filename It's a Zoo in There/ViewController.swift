//
//  ViewController.swift
//  It's a Zoo in There
//
//  Created by Jaswitha Reddy Guntaka on 1/14/23.
//

import UIKit
import AVFoundation



class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var label: UILabel!

    var audioPlayer: AVAudioPlayer!
    var animals = [Animal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1170, height: 600)
        
        let fox = Animal(name: "Vul", species: "Fox", age: 1, image: UIImage(named: "smiling-cute-funny-fox-pun")!, soundPath: "fox_sound")
        let squirrel = Animal(name: "Can", species: "Squirrel", age: 5, image: UIImage(named: "chocolate-chip-squirrel-shendl-rewitzky")!, soundPath: "red_squirrel_chatter")
        let panda = Animal(name: "Min", species: "Red Panda/Lesser Panda", age: 3, image: UIImage(named: "red-panda-cub-first-vet-visit-Paradise-wildlife-park-in-Hertfordshire-SWNS-1024x565")!, soundPath: "Red Panda Sound")
        
        animals.append(fox)
        animals.append(squirrel)
        animals.append(panda)
        
        animals.shuffle()
        
        label.text = animals[0].species
        
        var count = 0
        for i in animals{
            let button = UIButton(type: .system)
            let imageView = UIImageView()
            
            imageView.image = i.image
            imageView.frame = CGRect(x: 0 + (count * 390), y: 10, width: 400, height: 600)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .dynamic
            config.title = i.name
            config.baseBackgroundColor = .red
            button.configuration = config
            button.frame = CGRect(x: 280 + (count * 390), y: 20, width: 100, height: 40)
            button.tag = count
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            scrollView.addSubview(button)
            
            count += 1
        }
    }
    
    func playSound(soundPath: String) {
        guard let path = Bundle.main.path(forResource: soundPath, ofType: "mp3")
        else {
            print("Not found")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func buttonTapped(sender: UIButton!){
        let alert = UIAlertController(title: "Info",
                                      message: animals[sender.tag].description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Sound", style: .default, handler: { (alert: UIAlertAction!) in self.playSound(soundPath: self.animals[sender.tag].soundPath)}))
        
        //action in self.playSound(soundPath: self.animals[sender.tag].soundPath)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


extension ViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.delegate = self
        
        /* GRADIENT IN PROGRESS */

        let scrollPosition = scrollView.contentOffset.x / (scrollView.frame.size.width * 3)
        var gradient = 1 - abs(scrollPosition - 1)
        label.alpha = gradient
        gradient = 1
        
        let pageWidth: CGFloat = scrollView.frame.size.width
        let currentPage: CGFloat = floor(scrollView.contentOffset.x - pageWidth/2) / pageWidth + 1
        label.text = animals[Int(currentPage)].species
        
        
    }
}
