//
//  CarViewController.swift
//  UIPageViewControllerWithAnimationGit
//
//  Created by Артем on 4/16/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    private let carImage: UIImageView = {
        var image = UIImageView()
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false //чтобы отработали констрейнты
        
        return image
    }()
    
    
    private let carName: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 30)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        return name
    }()
    
    
    lazy var subview: [UIView] = [self.carImage, self.carName]
    
    
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .purple
        
        self.carName.text = carWith.name
        self.carImage.image = carWith.image
        
        //        edgesForExtendedLayout = [] //бровь десятки не закроет
        
        //        for view in subview {
        //            self.view.addSubview(view)
        //        }
        
        subview.forEach {
            self.view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150)])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carName, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: carName, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
