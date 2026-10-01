//
//  Jogo.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

struct Jogo: Codable, Sendable, Identifiable {
    let appid: Int
    let nome: String
    let ano: Int
    let preco: Double
    let gratuito: Bool
    let genero: String?
    let pctPositivas: Double
    let totalAvaliacoes: Int
    let ownersMid: Double
    let multiplataforma: Bool
    let temConquistas: Bool
    var id: Int { appid }
}

enum OrdenacaoJogo: String, CaseIterable, Identifiable {
    case avaliacao   = "Melhor avaliados"
    case alcance     = "Mais donos"
    case avaliacoes  = "Mais avaliados"
    case precoMaior  = "Mais caros"
    var id: String { rawValue }
}

struct FiltroJogos {
    var busca: String = ""
    var tipoPreco: TipoPreco = .todos
    var apenasMultiplataforma = false
    var apenasComConquistas = false
    var anoMinimo: Int = 1997
    var genero: String? = nil

    enum TipoPreco: String, CaseIterable, Identifiable {
        case todos = "Todos", gratuito = "Gratuitos", pago = "Pagos"
        var id: String { rawValue }
    }
}
