//
//  CheckCountView.swift
//  VIPERPractice
//
//  Created by Immanuel on 08/01/25.
//

import SwiftUI

struct CheckCountView: View {
    @StateObject var presenter: CheckCountPresenter
    
    var body: some View {
        VStack(spacing: 50) {
            Text(presenter.count)
                .frame(width: 50, height: 36)
        }
        .padding(.top, 50)
        Spacer()
    }
}
