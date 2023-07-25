//
//  toastView.swift
//  octordle
//
//  Created by Lasya Kambhampati on 7/11/23.
//

import SwiftUI

struct toastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}

struct toastView_Previews: PreviewProvider {
    static var previews: some View {
        toastView(toastText: "lol")
    }
}
