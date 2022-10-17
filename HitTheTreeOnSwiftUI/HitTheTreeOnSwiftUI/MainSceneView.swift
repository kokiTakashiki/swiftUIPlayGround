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
    
    private var mainScene = SCNScene(named: "art.scnassets/MainScene.scn")!
    
    var body: some View {
        SceneView(scene: mainScene)
            .onAppear {
                viewModel.onAppear()
                update()
            }
    }
}

extension MainSceneView {
    
}

struct MainSceneView_Previews: PreviewProvider {
    static var previews: some View {
        MainSceneView()
    }
}
