//
//  Genero.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

struct Genero: Codable, Sendable, Identifiable {
    let genero: String
    let n: Int
    let pctPositivasMediana: Double
    let pctPositivasMedia: Double
    let ownersMediana: Double
    let precoMediano: Double
    let pctMultiplataforma: Double
    var id: String { genero }
}

/// Qual métrica a tela de gêneros está exibindo.
enum MetricaGenero: String, CaseIterable, Identifiable {
    case avaliacao = "Avaliação"
    case alcance   = "Alcance"
    case preco     = "Preço"

    var id: String { rawValue }

    func valor(de g: Genero) -> Double {
        switch self {
        case .avaliacao: g.pctPositivasMediana
        case .alcance:   g.ownersMediana
        case .preco:     g.precoMediano
        }
    }

    var sufixoEixo: String {
        switch self {
        case .avaliacao: "% positivas (mediana)"
        case .alcance:   "donos estimados (mediana)"
        case .preco:     "preço em £ (mediana)"
        }
    }

    var usaEscalaLog: Bool { self == .alcance }
}
