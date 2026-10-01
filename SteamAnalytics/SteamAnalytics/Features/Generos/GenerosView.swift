//
//  GenerosView.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI
import Charts

struct GenerosView: View {
    @Bindable var vm: GenerosViewModel

    var body: some View {
        VStack(spacing: 16) {
            Chart(vm.ordenados) { g in
                BarMark(
                    x: .value(vm.metrica.sufixoEixo, vm.metrica.valor(de: g)),
                    y: .value("Gênero", g.genero)
                )
                .foregroundStyle(Color.accentColor.gradient)
                .annotation(position: .trailing) {
                    Text(g.n.formatted()).font(.caption2).foregroundStyle(.secondary)
                }
            }
            .chartXScale(type: vm.metrica.usaEscalaLog ? .log : .linear)
            .chartXAxisLabel(vm.metrica.sufixoEixo)
            .frame(minHeight: 360)
            .padding(.horizontal)

            if let lider = vm.lider {
                Text("\(lider.genero) lidera em \(vm.metrica.rawValue.lowercased()); o número ao lado de cada barra é a quantidade de jogos do gênero.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationTitle("Gêneros")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Picker("Métrica", selection: $vm.metrica) {
                    ForEach(MetricaGenero.allCases) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(.segmented)
                .frame(width: 320)
            }
        }
    }
}
