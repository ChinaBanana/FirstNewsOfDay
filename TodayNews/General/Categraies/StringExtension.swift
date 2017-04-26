//
//  StringExtension.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/24.
//  Copyright © 2017年 cyt. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func caculateHeightBy(_ dic:Dictionary<String, Any>, limitsize:CGSize) -> CGFloat {
        return self.boundingRect(with: limitsize, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size.height
    }
}
