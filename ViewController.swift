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
    
    var animals = [Animal]()
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer()
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1200, height: 600)
        
        let fox = Animal(name: "Vul", species: "Fox", age: 1, image: UIImage(named: "smiling-cute-funny-fox-pun")!, soundPath: "fox_sound.mp3")
        let squirrel = Animal(name: "Can", species: "Squirrel", age: 5, image: UIImage(named: "chocolate-chip-squirrel-shendl-rewitzky")!, soundPath: "red_squirrel_chatter.mp3")
        let panda = Animal(name: "Min", species: "Red Panda/Lesser Panda", age: 3, image: UIImage(named: "red-panda-cub-first-vet-visit-Paradise-wildlife-park-in-Hertfordshire-SWNS-1024x565")!, soundPath: "Red Panda Sound.mp3")
        
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
            imageView.frame = CGRect(x: 10 * count, y: 10, width: 400, height: 600)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            //print(i.image)
            
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .dynamic
            config.title = i.name
            config.baseBackgroundColor = .red
            button.configuration = config
            button.frame = CGRect(x: 280 + (count * 390), y: 20, width: 100, height: 40)
            button.tag = count
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            scrollView.addSubview(button)
            
            audioPlayer = try? AVAudioPlayer.init(contentsOf: URL(fileURLWithPath: i.soundPath))
            //print(i.soundPath)
            audioPlayer?.numberOfLoops = 1
            
            count += 1
        }
    }
    @objc func buttonTapped(sender: UIButton!){
        let alert = UIAlertController(title: "Info",
                                      message: animals[sender.tag].description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Sound", style: .default, handler: {action in self.audioPlayer?.play()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}


extension ViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.delegate = self
        
        let pageWidth: CGFloat = 400
        let currentPage: CGFloat = floor(scrollView.contentOffset.x - pageWidth/2) / pageWidth + 1
        
        if Int(currentPage) == 0{
            label.text = animals[0].species
        }
        else if Int(currentPage) == 1{
            label.text = animals[1].species
        }
        else if Int(currentPage) == 2{
            label.text = animals[2].species
        }
    }
}
