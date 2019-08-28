//
//  VerticalStackView.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/25/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
       super.init(frame: .zero)
        arrangedSubviews.forEach { (view) in
            addArrangedSubview(view)
        }
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
