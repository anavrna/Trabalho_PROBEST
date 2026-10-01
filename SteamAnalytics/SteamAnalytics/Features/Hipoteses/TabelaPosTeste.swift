//
//  TabelaPosTeste.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct TabelaPosTeste: View {
    let pares: [ParPosTeste]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Comparações par a par (Bonferroni)").font(.caption.bold())
            ForEach(pares) { par in
                HStack {
                    Text("\(par.grupoA) × \(par.grupoB)")
                    Spacer()
                    Text(par.pAjustado < 0.001 ? "< 0,001"
                                               : String(format: "%.3f", par.pAjustado))
                        .monospacedDigit()
                    Image(systemName: par.significativo ? "checkmark.circle.fill" : "minus.circle")
                        .foregroundStyle(par.significativo ? .green : .secondary)
                }
                .font(.caption)
            }
        }
    }
}
