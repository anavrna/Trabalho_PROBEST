//
//  ExplorarView.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct ExplorarView: View {
    @Bindable var vm: ExplorarViewModel
    @State private var selecionado: Jogo.ID?
    @State private var mostrandoFiltros = true

    var body: some View {
        Table(vm.resultado, selection: $selecionado) {
            TableColumn("Jogo", value: \.nome)
            TableColumn("Ano") { Text(String($0.ano)) }
                .width(60)
            TableColumn("Gênero") { Text($0.genero ?? "—") }
                .width(110)
            TableColumn("% positivas") { jogo in
                Text(jogo.pctPositivas, format: .number.precision(.fractionLength(1)))
            }
            .width(100)
            TableColumn("Avaliações") { Text($0.totalAvaliacoes.formatted()) }
                .width(100)
            TableColumn("Donos (est.)") { Text($0.ownersMid.formatted(.number.notation(.compactName))) }
                .width(110)
            TableColumn("Preço") { jogo in
                Text(jogo.gratuito ? "Gratuito"
                                   : "£\(jogo.preco, format: .number.precision(.fractionLength(2)))")
            }
            .width(90)
        }
        .navigationTitle("Explorar")
        .navigationSubtitle(vm.resumoResultado)
        .searchable(text: $vm.filtro.busca, placement: .toolbar, prompt: "Buscar jogo")
        .inspector(isPresented: $mostrandoFiltros) {
            FiltrosInspector(filtro: $vm.filtro, limpar: vm.limparFiltros)
                .inspectorColumnWidth(min: 220, ideal: 260, max: 320)
        }
        .toolbar {
            ToolbarItem {
                Picker("Ordenar", selection: $vm.ordenacao) {
                    ForEach(OrdenacaoJogo.allCases) { Text($0.rawValue).tag($0) }
                }
            }
            ToolbarItem {
                Button("Filtros", systemImage: "sidebar.right") {
                    mostrandoFiltros.toggle()
                }
            }
        }
    }
}


