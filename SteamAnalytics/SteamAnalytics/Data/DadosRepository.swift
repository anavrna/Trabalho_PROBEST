//
//  DadosRepository.swift
//  SteamAnalytics
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Foundation

protocol DadosRepositoryProtocol: Sendable {
    func carregar() throws -> ConjuntoDeDados
}

struct ConjuntoDeDados: Sendable {
    let resumo: Resumo
    let series: Series
    let generos: [Genero]
    let hipoteses: [Hipotese]
    let jogos: [Jogo]
}

enum ErroDados: LocalizedError {
    case arquivoNaoEncontrado(String)
    case falhaDecodificacao(String, Error)

    var errorDescription: String? {
        switch self {
        case .arquivoNaoEncontrado(let nome):
            "Arquivo \(nome).json não está no bundle do app."
        case .falhaDecodificacao(let nome, let erro):
            "Não foi possível ler \(nome).json: \(erro.localizedDescription)"
        }
    }
}

struct BundleDadosRepository: DadosRepositoryProtocol {
    let bundle: Bundle = .main

    func carregar() throws -> ConjuntoDeDados {
        ConjuntoDeDados(
            resumo:    try ler("resumo"),
            series:    try ler("series"),
            generos:   try ler("generos"),
            hipoteses: try ler("hipoteses"),
            jogos:     try ler("jogos")
        )
    }

    private func ler<T: Decodable>(_ nome: String) throws -> T {
        guard let url = bundle.url(forResource: nome, withExtension: "json") else {
            throw ErroDados.arquivoNaoEncontrado(nome)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            return try decoder.decode(T.self, from: Data(contentsOf: url))
        } catch {
            throw ErroDados.falhaDecodificacao(nome, error)
        }
    }
}
