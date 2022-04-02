//
//  View+halfModal.swift
//  webViewTest
//
//  Created by 武田孝騎 on 2022/04/02.
//

import SwiftUI

extension View {
    func halfModal<Sheet: View>(
        isShow: Binding<Bool>,
        @ViewBuilder sheet: @escaping () -> Sheet,
        onEnd: @escaping () -> ()
    ) -> some View {
        return self
            .background(
                HalfModalSheet(
                    sheet: sheet(),
                    isShow: isShow,
                    onClose: onEnd
                )
            )
    }
}
