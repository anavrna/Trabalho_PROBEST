//
//  Hipotese.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

struct Hipotese: Codable, Sendable, Identifiable {
    let id: String            // "H1" ... "H6"
    let pergunta: String
    let h0: String
    let teste: String
    let estatisticaNome: String
    let estatistica: Double
    let pValor: Double
    let alfa: Double
    let rejeitaH0: Bool
    let efeitoNome: String
    let efeitoValor: Double
    let efeitoRotulo: String  // desprezível | pequeno | médio | grande
    let conclusao: String
    let grafico: TipoGrafico
    let dados: [PontoHipotese]
    let posTeste: [ParPosTeste]?

    /// Texto curto para o badge, já pronto para a UI.
    var decisao: String {
        rejeitaH0 ? "Rejeita H₀" : "Não rejeita H₀"
    }

    /// p-valores minúsculos viram "< 0,001" em vez de notação científica.
    var pFormatado: String {
        pValor < 0.001 ? "< 0,001" : String(format: "%.3f", pValor)
    }
}

enum TipoGrafico: String, Codable, Sendable {
    case barrasGrupo      = "barras_grupo"
    case barrasProporcao  = "barras_proporcao"
    case dispersao        = "dispersao"
    case barrasOrdenadas  = "barras_ordenadas"
    case linhaPeriodo     = "linha_periodo"
}

struct PontoHipotese: Codable, Sendable, Identifiable {
    let rotulo: String
    let valor: Double
    let n: Int?
    let x: Double?        // usado só por dispersao (preço)
    var id: String { rotulo }
}

struct ParPosTeste: Codable, Sendable, Identifiable {
    let grupoA: String
    let grupoB: String
    let pAjustado: Double
    let significativo: Bool
    var id: String { "\(grupoA)|\(grupoB)" }
}
