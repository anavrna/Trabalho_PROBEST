//
//  AppState.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Observation
import Foundation

@Observable
final class AppState {
    enum Estado { case carregando, pronto(ConjuntoDeDados), falha(String) }

    private(set) var estado: Estado = .carregando
    private let repo: DadosRepositoryProtocol

    init(repo: DadosRepositoryProtocol = BundleDadosRepository()) {
        self.repo = repo
    }

    func carregar() {
        do {
            estado = .pronto(try repo.carregar())
        } catch {
            estado = .falha(error.localizedDescription)
        }
    }

    var dados: ConjuntoDeDados? {
        if case .pronto(let d) = estado { return d }
        return nil
    }
}
