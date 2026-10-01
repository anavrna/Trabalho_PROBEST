//
//  HipotesesView.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct HipotesesView: View {
    @Bindable var vm: HipotesesViewModel
    // Em janela larga os cards ficam lado a lado; em janela estreita, empilhados.
    private let colunas = [GridItem(.adaptive(minimum: 380), spacing: 16)]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("\(vm.totalRejeitadas) de 6 testes rejeitam H₀ a α = 0,05. \(vm.significativasComEfeitoFraco) deles têm tamanho de efeito fraco.")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                LazyVGrid(columns: colunas, alignment: .leading, spacing: 16) {
                    ForEach(vm.lista) { h in
                        HipoteseCard(
                            hipotese: h,
                            expandida: vm.expandida == h.id,
                            aoTocar: { vm.alternar(h.id) }
                        )
                    }
                }

                RodapeMetodologico(resumo: vm.resumo)
            }
            .padding()
        }
        .navigationTitle("Hipóteses")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Toggle("Só as que rejeitam H₀", isOn: $vm.somenteSignificativas)
                    .toggleStyle(.checkbox)
            }
        }
    }
}
