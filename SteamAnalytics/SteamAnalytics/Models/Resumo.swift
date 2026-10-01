//
//  Resumo.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

struct Resumo: Codable, Sendable {
    let geradoEm: String
    let totalJogos: Int
    let jogosBaseAvaliacao: Int
    let minAvaliacoes: Int
    let pctPositivasMediana: Double
    let precoMediano: Double
    let moeda: String
    let pctGratuitos: Double
    let pctMultiplataforma: Double
    let pctComConquistas: Double
    let anoMin: Int
    let anoMax: Int
}
