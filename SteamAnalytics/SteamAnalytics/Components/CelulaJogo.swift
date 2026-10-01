//
//  CelulaJogo.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct CelulaJogo: View {
    let jogo: Jogo

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(jogo.nome).font(.headline)
                HStack(spacing: 8) {
                    Text(String(jogo.ano))
                    if let g = jogo.genero { Text(g) }
                    Text(jogo.gratuito ? "Gratuito"
                                       : "£\(jogo.preco, format: .number.precision(.fractionLength(2)))")
                    if jogo.multiplataforma { Label("Multiplataforma", systemImage: "desktopcomputer") }
                    if jogo.temConquistas { Label("Conquistas", systemImage: "trophy") }
                }
                .font(.caption).foregroundStyle(.secondary)
            }
            Spacer()
            Text("\(jogo.pctPositivas, format: .number.precision(.fractionLength(0)))%")
                .font(.title3.monospacedDigit())
        }
        .padding(.vertical, 4)
    }
}
