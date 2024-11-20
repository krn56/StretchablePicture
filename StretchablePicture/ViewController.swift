//
//  ViewController.swift
//  StretchablePicture
//
//  Created by Роман Крендясов on 20.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageHeight: CGFloat = 270.0
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "bsLogo")
        let view = UIImageView(image: image)
        view.frame.size = CGSize(width: self.view.frame.width, height: imageHeight)
        view.frame.origin = .zero
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: view.frame)
        view.contentSize.height = view.frame.height + imageHeight
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset <= 0 {
            imageView.frame.origin.y = offset
            imageView.frame.size.height = imageHeight - offset
        }
        scrollView.verticalScrollIndicatorInsets.top = imageHeight - offset - view.layoutMargins.top
    }
}

#Preview {
    ViewController()
}
