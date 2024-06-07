//
//  NavigationBar.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 07/06/24.
//

import SwiftUI

struct NavigationBar: View {
    var title: String
    var backButtonAction: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button(action: backButtonAction) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Theme.getColor(named: .white_FFFFFF))
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                Text(title)
                    .foregroundColor(Theme.getColor(named: .white_FFFFFF))
                    .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 16))
                Spacer()
            }
            .padding()
            .background(Theme.getColor(named: .red_C10004))
        }
    }
}



