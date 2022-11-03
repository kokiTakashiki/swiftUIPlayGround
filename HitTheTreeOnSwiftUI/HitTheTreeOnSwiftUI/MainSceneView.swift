//
//  MainSceneView.swift
//  HitTheTreeOnSwiftUI
//
//  Created by 武田孝騎 on 2022/10/17.
//

import SwiftUI
import SceneKit

struct MainSceneView: View {
    @State var viewModel = MainSceneViewModel()
    @State private var isDragging = false
    var mainScene: SCNScene {
        guard let main = SCNScene(named: "art.scnassets/MainScene.scn") else {
            print("main load error")
            return SCNScene()
        }
        return main
    }
    
    let renderer: Renderer
    
    var body: some View {
        SceneView(
            scene: renderer.mainScene,
            delegate: renderer
        )
        .gesture(drag)
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                print("change \(value.translation)")
                change(of: renderer.ballNode, with: value.translation)
            }
            .onEnded { value in
                self.isDragging = false
            }
    }
}

extension MainSceneView {
    private func change(of node: SCNNode, with translation: CGSize) {
        let x = Float(translation.width)
        let y = Float(-translation.height)

        let anglePan = sqrt(pow(x,2)+pow(y,2)) * (Float)(Double.pi) / 180.0

        let vector = SCNVector3(x: x*0.001, y: 0, z: y*0.001)

        renderer.ballNode?.physicsBody?.velocity += vector
        print("result new: \(vector) now: \(renderer.ballNode)")
    }
}

final class Renderer: NSObject, SCNSceneRendererDelegate, SCNPhysicsContactDelegate {
    
    let CategoryTree = 2
    
    var mainScene: SCNScene {
        guard let main = SCNScene(named: "art.scnassets/MainScene.scn") else {
            print("main load error")
            return SCNScene()
        }
        return main
    }

    var ballNode: SCNNode!
    var selfieStickNode: SCNNode!

    override init() {
        super.init()
        mainScene.physicsWorld.contactDelegate = self
        ballNode = mainScene.rootNode.childNode(withName: "ball", recursively: true)!
        ballNode.physicsBody?.contactTestBitMask = CategoryTree
        selfieStickNode = mainScene.rootNode.childNode(withName: "selfieStick", recursively: true)!
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        camPositionChange()
    }
    
    private func camPositionChange() {
        let ball = ballNode.presentation
        let ballPosition = ball.position
        
        let targetPosition = SCNVector3(x: ballPosition.x, y: ballPosition.y + 5, z:ballPosition.z + 5)
        var cameraPosition = selfieStickNode.position
        
        let camDamping:Float = 0.3
        
        let xComponent = cameraPosition.x * (1 - camDamping) + targetPosition.x * camDamping
        let yComponent = cameraPosition.y * (1 - camDamping) + targetPosition.y * camDamping
        let zComponent = cameraPosition.z * (1 - camDamping) + targetPosition.z * camDamping
        
        cameraPosition = SCNVector3(x: xComponent, y: yComponent, z: zComponent)
    }
}

struct MainSceneView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView(renderer: Renderer())
    }
}
