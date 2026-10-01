//
//  ExplorarViewModel.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Observation
import Foundation

@Observable
final class ExplorarViewModel {
    private let todos: [Jogo]
    var filtro = FiltroJogos()
    var ordenacao: OrdenacaoJogo = .avaliacao

    init(jogos: [Jogo]) { self.todos = jogos }

    var resultado: [Jogo] {
        todos
            .filter { jogo in
                if !filtro.busca.isEmpty,
                   !jogo.nome.localizedCaseInsensitiveContains(filtro.busca) { return false }
                switch filtro.tipoPreco {
                case .gratuito where !jogo.gratuito: return false
                case .pago where jogo.gratuito:      return false
                default: break
                }
                if filtro.apenasMultiplataforma, !jogo.multiplataforma { return false }
                if filtro.apenasComConquistas, !jogo.temConquistas { return false }
                if jogo.ano < filtro.anoMinimo { return false }
                if let g = filtro.genero, jogo.genero != g { return false }
                return true
            }
            .sorted(by: comparador)
    }

    private var comparador: (Jogo, Jogo) -> Bool {
        switch ordenacao {
        case .avaliacao:  { $0.pctPositivas > $1.pctPositivas }
        case .alcance:    { $0.ownersMid > $1.ownersMid }
        case .avaliacoes: { $0.totalAvaliacoes > $1.totalAvaliacoes }
        case .precoMaior: { $0.preco > $1.preco }
        }
    }

    var resumoResultado: String {
        "\(resultado.count) de \(todos.count) jogos"
    }

    func limparFiltros() {
        filtro = FiltroJogos()
    }
}
