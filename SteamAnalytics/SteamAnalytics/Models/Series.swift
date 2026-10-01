//
//  Series.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

struct Series: Codable, Sendable {
    let lancamentosPorAno: [PontoAno]
    let pctPositivasPorAno: [ResumoAno]
    let faixasPreco: [FaixaPreco]
    let periodos: [Periodo]
}

struct PontoAno: Codable, Sendable, Identifiable {
    let ano: Int
    let qtd: Int
    var id: Int { ano }
}

struct ResumoAno: Codable, Sendable, Identifiable {
    let ano: Int
    let mediana: Double
    let q1: Double
    let q3: Double
    let n: Int
    var id: Int { ano }
}

struct FaixaPreco: Codable, Sendable, Identifiable {
    let faixa: String
    let ordem: Int
    let n: Int
    let pctPositivasMediana: Double
    var id: Int { ordem }
}

struct Periodo: Codable, Sendable, Identifiable {
    let periodo: String
    let ordem: Int
    let n: Int
    let pctPositivasMediana: Double
    var id: Int { ordem }
}
