//
//  KPICard.swift
//  
//
//  Created by Vírna Carvalho on 01/10/26.
//

import SwiftUI

struct KPICard: View {
    let kpi: KPI

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(kpi.titulo).font(.caption).foregroundStyle(.secondary)
            Text(kpi.valor).font(.title2.bold()).contentTransition(.numericText())
            Text(kpi.nota).font(.caption2).foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 12))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(kpi.titulo): \(kpi.valor), \(kpi.nota)")
    }
}
