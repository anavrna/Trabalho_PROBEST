//
//  HipotesesViewModel.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import Observation

@Observable
final class HipotesesViewModel {
    private let todas: [Hipotese]
    let resumo: Resumo
    var somenteSignificativas = false
    var expandida: String? = nil

    init(hipoteses: [Hipotese], resumo: Resumo) {
        self.todas = hipoteses
        self.resumo = resumo
    }
    var lista: [Hipotese] {
        somenteSignificativas ? todas.filter(\.rejeitaH0) : todas
    }

    var totalRejeitadas: Int { todas.filter(\.rejeitaH0).count }

    /// Quantas rejeitam H₀ mas têm efeito desprezível ou pequeno — o alerta do trabalho.
    var significativasComEfeitoFraco: Int {
        todas.filter { $0.rejeitaH0 && ["desprezível", "pequeno"].contains($0.efeitoRotulo) }.count
    }

    func alternar(_ id: String) {
        expandida = (expandida == id) ? nil : id
    }
}
