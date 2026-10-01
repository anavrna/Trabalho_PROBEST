//
//  HipoteseCard.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI
import AppKit   // NSCursor

struct HipoteseCard: View {
    let hipotese: Hipotese
    let expandida: Bool
    let aoTocar: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Text(hipotese.id)
                    .font(.caption.bold())
                    .padding(.horizontal, 8).padding(.vertical, 3)
                    .background(.quaternary, in: Capsule())
                Text(hipotese.pergunta).font(.headline)
            }

            Text("H₀: \(hipotese.h0)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                Label(hipotese.teste, systemImage: "function")
                Text("\(hipotese.estatisticaNome) = \(hipotese.estatistica, format: .number.precision(.fractionLength(2)))")
                Text("p \(hipotese.pFormatado)")
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            BadgeDecisao(rejeita: hipotese.rejeitaH0)
            BarraEfeito(nome: hipotese.efeitoNome,
                        valor: hipotese.efeitoValor,
                        rotulo: hipotese.efeitoRotulo)

            if expandida {
                Divider()
                GraficoHipotese(hipotese: hipotese)
                    .frame(height: 200)
                Text(hipotese.conclusao).font(.callout)
                if let pares = hipotese.posTeste, !pares.isEmpty {
                    TabelaPosTeste(pares: pares)
                }
            }
        }
        .padding()
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 14))
        .contentShape(Rectangle())
        .onTapGesture(perform: aoTocar)
        .onHover { dentro in
            // ponteiro de mão indica que o card é clicável
            dentro ? NSCursor.pointingHand.push() : NSCursor.pop()
        }
        .help(expandida ? "Clique para recolher" : "Clique para ver o gráfico e a conclusão")
        .animation(.snappy, value: expandida)
    }
}
