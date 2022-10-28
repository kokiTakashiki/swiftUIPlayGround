//
//  VectorOperations.swift
//  HitTheTreeOnSwiftUI
//
//  Created by 武田孝騎 on 2022/10/29.
//

import Foundation
import SceneKit


func +(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
    return SCNVector3(x:left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}


func +=( left: inout SCNVector3, right: SCNVector3) {
    left = left + right
}

