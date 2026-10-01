//
//  FiltrosInspector.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct FiltrosInspector: View {
    @Binding var filtro: FiltroJogos
    let limpar: () -> Void

    var body: some View {
        Form {
            Picker("Preço", selection: $filtro.tipoPreco) {
                ForEach(FiltroJogos.TipoPreco.allCases) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.segmented)

            Toggle("Só multiplataforma", isOn: $filtro.apenasMultiplataforma)
            Toggle("Só com conquistas", isOn: $filtro.apenasComConquistas)

            Stepper("Lançado a partir de \(String(filtro.anoMinimo))",
                    value: $filtro.anoMinimo, in: 1997...2019)

            Button("Limpar filtros", action: limpar)
        }
        .formStyle(.grouped)
    }
}
