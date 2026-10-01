//
//  MockDadosRepository.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//
struct MockDadosRepository: DadosRepositoryProtocol {
    func carregar() throws -> ConjuntoDeDados { .exemplo }
}

extension ConjuntoDeDados {
    static let exemplo = ConjuntoDeDados(
        resumo: Resumo(geradoEm: "2026-09-29", totalJogos: 27075,
                       jogosBaseAvaliacao: 11818, minAvaliacoes: 50,
                       pctPositivasMediana: 82.4, precoMediano: 3.99, moeda: "GBP",
                       pctGratuitos: 12.1, pctMultiplataforma: 31.7,
                       pctComConquistas: 54.3, anoMin: 1997, anoMax: 2019),
        series: Series(lancamentosPorAno: [], pctPositivasPorAno: [],
                       faixasPreco: [], periodos: []),
        generos: [],
        hipoteses: [],
        jogos: []
    )
}
