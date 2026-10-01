//
//  BadgeDecisao.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct BadgeDecisao: View {
    let rejeita: Bool

    var body: some View {
        Label(rejeita ? "Rejeita H₀" : "Não rejeita H₀",
              systemImage: rejeita ? "checkmark.seal.fill" : "minus.circle")
            .font(.caption.bold())
            .padding(.horizontal, 10).padding(.vertical, 5)
            .background(rejeita ? Color.green.opacity(0.18) : Color.gray.opacity(0.18),
                        in: Capsule())
            .foregroundStyle(rejeita ? .green : .secondary)
    }
}
