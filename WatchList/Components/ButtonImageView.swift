//
//  ButtonImageView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/13/25.
//

import SwiftUI

struct ButtonImageView: View {
    //MARK: PROPERTIES
    let symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle()
                    .fill(.ultraThinMaterial)
            )
            .frame(width: 80)
    }
}

#Preview {
    ButtonImageView(symbolName: "plus.circle.fill")
}
