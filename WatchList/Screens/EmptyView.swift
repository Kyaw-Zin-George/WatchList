//
//  EmptyView.swift
//  WatchList
//
//  Created by Kyaw Thant Zin(George) on 3/11/25.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        Circle()
            .fill(.blue.gradient)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
            .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
            .frame(width: 180)
            .overlay {
                Image(systemName: movieClapper)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundStyle(.white)
                    .padding(.top,-6)
            }
    }
}

#Preview {
    EmptyView()
}
