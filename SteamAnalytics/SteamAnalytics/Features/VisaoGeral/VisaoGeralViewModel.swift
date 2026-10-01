//
//  VisaoGeralViewModel.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Observation
import Foundation
@Observable
final class VisaoGeralViewModel {
    let resumo: Resumo
    let lancamentos: [PontoAno]

    init(resumo: Resumo, series: Series) {
        self.resumo = resumo
        self.lancamentos = series.lancamentosPorAno.sorted { $0.ano < $1.ano }
    }

    var cards: [KPI] {
        [
            KPI(titulo: "Jogos no catálogo",
                valor: resumo.totalJogos.formatted(.number.grouping(.automatic)),
                nota: "base completa"),
            KPI(titulo: "Base de avaliação",
                valor: resumo.jogosBaseAvaliacao.formatted(.number.grouping(.automatic)),
                nota: "≥ \(resumo.minAvaliacoes) avaliações"),
            KPI(titulo: "% positivas",
                valor: resumo.pctPositivasMediana.formatted(.number.precision(.fractionLength(1))) + "%",
                nota: "mediana"),
            KPI(titulo: "Preço",
                valor: "£" + resumo.precoMediano.formatted(.number.precision(.fractionLength(2))),
                nota: "mediano, em GBP"),
            KPI(titulo: "Gratuitos",
                valor: resumo.pctGratuitos.formatted(.number.precision(.fractionLength(1))) + "%",
                nota: "do catálogo"),
            KPI(titulo: "Multiplataforma",
                valor: resumo.pctMultiplataforma.formatted(.number.precision(.fractionLength(1))) + "%",
                nota: "mais de um SO")
        ]
    }

    var anoPico: PontoAno? { lancamentos.max { $0.qtd < $1.qtd } }
}

struct KPI: Identifiable {
    let titulo: String
    let valor: String
    let nota: String
    var id: String { titulo }
}
