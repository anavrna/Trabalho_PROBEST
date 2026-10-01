//
//  GenerosViewModel.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Observation

@Observable
final class GenerosViewModel {
    private let todos: [Genero]
    var metrica: MetricaGenero = .avaliacao

    init(generos: [Genero]) { self.todos = generos }

    var ordenados: [Genero] {
        todos.sorted { metrica.valor(de: $0) > metrica.valor(de: $1) }
    }

    var lider: Genero? { ordenados.first }

    var totalJogosClassificados: Int { todos.reduce(0) { $0 + $1.n } }
}
