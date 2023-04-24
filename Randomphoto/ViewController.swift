//
//  ViewController.swift
//  Randomphoto
//
//  Created by Mizo on 26/08/2022.
//
import Instabug
import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Get Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colorss: [UIColor] = [
        .systemMint, .systemPurple,.systemRed, .systemBlue, .systemCyan, .systemPink, .systemIndigo, .systemOrange, .systemGreen, .systemIndigo, .systemYellow
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: view.frame.size.height-50-view.safeAreaInsets.bottom, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-200-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
        
    }
    func getRandomPhoto() {
        let urlString = "https://picsum.photos/200"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else { return
            
        }
        imageView.image = UIImage(data: data)
    }
   @objc func didTapButton() {
       getRandomPhoto()
           view.backgroundColor = colorss.randomElement()
    }


}

