//
//  CountView.swift
//  VIPERPractice
//
//  Created by Immanuel on 08/01/25.
//

import SwiftUI

struct CountView: View {
    @StateObject var presenter: Presenter
    
    var body: some View {
        VStack(spacing: 50) {
            Text(presenter.count)
                .frame(width: 50, height: 36)
            HStack(spacing: 50) {
                Button {
                    presenter.incrementCount()
                } label: {
                    Image(systemName: "plus.app.fill")
                }
                .buttonStyle(.borderedProminent)
                Button {
                    presenter.decrementCount()
                } label: {
                    Image(systemName: "minus.square.fill")
                }
                .buttonStyle(.borderedProminent)
            }
            Button("View") {
                presenter.onSelectViewCount()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 80)
        Spacer()
    }
}
