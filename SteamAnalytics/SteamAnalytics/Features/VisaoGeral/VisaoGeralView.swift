//
//  VisaoGeralView.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI
import Charts

struct VisaoGeralView: View {
    let vm: VisaoGeralViewModel
    // Em janela larga cabem 6 cards em uma linha; ao estreitar, quebram sozinhos.
    private let colunas = [GridItem(.adaptive(minimum: 180), spacing: 16)]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: colunas, spacing: 16) {
                ForEach(vm.cards) { KPICard(kpi: $0) }
            }
            .padding(.horizontal)

            GroupBox("Lançamentos por ano") {
                Chart(vm.lancamentos) { ponto in
                    BarMark(
                        x: .value("Ano", ponto.ano),
                        y: .value("Jogos", ponto.qtd)
                    )
                    .foregroundStyle(Color.accentColor.gradient)
                }
                .chartXAxis { AxisMarks(values: .stride(by: 2)) }
                .frame(minHeight: 260)
                .accessibilityLabel("Gráfico de lançamentos por ano")

                if let pico = vm.anoPico {
                    Text("Pico em \(String(pico.ano)): \(pico.qtd) jogos lançados.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()

            RodapeMetodologico(resumo: vm.resumo)
        }
        .navigationTitle("Steam em números")
    }
}
