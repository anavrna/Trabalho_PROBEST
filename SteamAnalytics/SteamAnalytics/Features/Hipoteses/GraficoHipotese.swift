//
//  GraficoHipotese.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI
import Charts

struct GraficoHipotese: View {
    let hipotese: Hipotese

    var body: some View {
        switch hipotese.grafico {
        case .barrasGrupo, .barrasProporcao, .barrasOrdenadas:
            Chart(hipotese.dados) { p in
                BarMark(x: .value("Grupo", p.rotulo),
                        y: .value("Valor", p.valor))
                .foregroundStyle(Color.accentColor.gradient)
                .annotation(position: .top) {
                    Text(p.valor, format: .number.precision(.fractionLength(1)))
                        .font(.caption2)
                }
            }
            .chartYScale(type: hipotese.id == "H5" ? .log : .linear)

        case .dispersao:
            Chart(hipotese.dados) { p in
                PointMark(x: .value("Preço (£)", p.x ?? 0),
                          y: .value("% positivas", p.valor))
                .opacity(0.35)
            }

        case .linhaPeriodo:
            Chart(hipotese.dados) { p in
                LineMark(x: .value("Período", p.rotulo),
                         y: .value("% positivas", p.valor))
                PointMark(x: .value("Período", p.rotulo),
                          y: .value("% positivas", p.valor))
            }
        }
    }
}
