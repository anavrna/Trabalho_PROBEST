//
//  RodapeMetodologico.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct RodapeMetodologico: View {
    let resumo: Resumo

    var body: some View {
        Text("Percentuais calculados sobre \(resumo.jogosBaseAvaliacao.formatted()) jogos com pelo menos \(resumo.minAvaliacoes) avaliações. Preços em \(resumo.moeda). Donos são estimativa do SteamSpy (ponto médio da faixa). Dados gerados em \(resumo.geradoEm).")
            .font(.caption2)
            .foregroundStyle(.secondary)
            .padding()
    }
}
