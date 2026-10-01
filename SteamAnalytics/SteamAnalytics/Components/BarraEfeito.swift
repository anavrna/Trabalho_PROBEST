//
//  BarraEfeito.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct BarraEfeito: View {
    let nome: String
    let valor: Double
    let rotulo: String

    /// Normaliza para 0–1 usando 0,5 como teto prático ("grande").
    private var fracao: Double { min(abs(valor) / 0.5, 1) }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Tamanho de efeito (\(nome))").font(.caption2)
                Spacer()
                Text("\(valor, format: .number.precision(.fractionLength(2))) · \(rotulo)")
                    .font(.caption2.bold())
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(.quaternary)
                    Capsule().fill(cor).frame(width: geo.size.width * fracao)
                }
            }
            .frame(height: 6)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Tamanho de efeito \(rotulo), \(nome) igual a \(valor)")
    }

    private var cor: Color {
        switch rotulo {
        case "grande": .indigo
        case "médio":  .teal
        case "pequeno": .orange
        default:       .gray
        }
    }
}
