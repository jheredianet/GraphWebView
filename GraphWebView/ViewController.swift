//
//  ViewController.swift
//  GraphWebView
//
//  Created by Juan Carlos Heredia Mayer on 25/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView()
    
    override public var shouldAutorotate: Bool {
        return false
      }
      override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
      }
      override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
      }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        guard let url = URL(string: "https://grafana.infoinnova.net/d/jOBHZh1Gz/instant-consumption?orgId=1&kiosk") else {
            return
        }
        webView.load(URLRequest(url: url))
        
        // Do any additional setup after loading the view.
        // view.backgroundColor = .white
        
        //view.addSubview(imageView)
        //imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        //imageView.center = view.center
        
        //view.addSubview(button)
        //button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        //getRandomPhoto()
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webView.frame = view.bounds
        
        //button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 55)
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
}

