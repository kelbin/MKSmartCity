//
//  Core.swift
//  MCHSmartCity
//
//  Created by Kelbinary on 14.07.2022.
//

import UIKit

protocol CommonEntity {
    var cellIdentifier: String { get }
    var size: CGSize { get set }
}

protocol Setupable {
    func setup(_ model: Any)
}
