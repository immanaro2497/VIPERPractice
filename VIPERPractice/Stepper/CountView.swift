//
//  CountView.swift
//  VIPERPractice
//
//  Created by Immanuel on 08/01/25.
//

import SwiftUI

struct CountView: View {
    @StateObject var countViewModel: CountViewModel
    let onSelectView: () -> Void
    
    var body: some View {
        VStack(spacing: 50) {
            Text(countViewModel.count)
                .frame(width: 50, height: 36)
            HStack(spacing: 50) {
                Button {
                    countViewModel.incrementCount()
                } label: {
                    Image(systemName: "plus.app.fill")
                }
                .buttonStyle(.borderedProminent)
                Button {
                    countViewModel.decrementCount()
                } label: {
                    Image(systemName: "minus.square.fill")
                }
                .buttonStyle(.borderedProminent)
            }
            Button("View") {
                onSelectView()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 80)
        .onAppear {
            countViewModel.loadData()
        }
        Spacer()
    }
}
