//
//  RootView.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

enum Secao: String, CaseIterable, Identifiable, Hashable {
    case visaoGeral = "Visão geral"
    case generos    = "Gêneros"
    case hipoteses  = "Hipóteses"
    case explorar   = "Explorar"

    var id: String { rawValue }

    var icone: String {
        switch self {
        case .visaoGeral: "square.grid.2x2"
        case .generos:    "chart.bar"
        case .hipoteses:  "function"
        case .explorar:   "magnifyingglass"
        }
    }
}

struct RootView: View {
    @Environment(AppState.self) private var app
    @State private var secao: Secao = .visaoGeral

    var body: some View {
        switch app.estado {
        case .carregando:
            ProgressView("Carregando dados…")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .falha(let msg):
            ContentUnavailableView("Não foi possível carregar",
                                   systemImage: "exclamationmark.triangle",
                                   description: Text(msg))
        case .pronto(let dados):
            NavigationSplitView {
                List(Secao.allCases, selection: $secao) { s in
                    Label(s.rawValue, systemImage: s.icone).tag(s)
                }
                .navigationSplitViewColumnWidth(min: 180, ideal: 200, max: 240)
                .listStyle(.sidebar)
            } detail: {
                switch secao {
                case .visaoGeral:
                    VisaoGeralView(vm: .init(resumo: dados.resumo, series: dados.series))
                case .generos:
                    GenerosView(vm: .init(generos: dados.generos))
                case .hipoteses:
                    HipotesesView(vm: .init(hipoteses: dados.hipoteses, resumo: dados.resumo))
                case .explorar:
                    ExplorarView(vm: .init(jogos: dados.jogos))
                }
            }
        }
    }
}
