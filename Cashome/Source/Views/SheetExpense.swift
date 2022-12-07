//
//  Sheet.swift
//  Cashome
//
//  Created by Christian Paulo on 01/12/22.
//

import SwiftUI

struct SheetExpense: View {

    @Environment(\.dismiss) var dismiss
    @State private var value = ""
    @State internal var description = ""
    @State private var deadline = Date()
    @State private var paymentDay = Date()
    @State private var statusPay : Bool = false
    @State private var responsible: Flavor = .marcelo

    var body: some View {

        NavigationView {

            VStack {

                Form {

                    Section {
                        TextField("Valor",text : $value)
                    }

                    Section {
                        TextField("Descrição",text : $description)
                    }

                    Section {
                        DatePicker(
                            selection: $deadline,
                            in: Date()...,
                            displayedComponents: .date,
                            label: {
                                Text("Data Vencimento")
                            }
                        )

                        DatePicker(
                            selection: $paymentDay,
                            in: Date()...,
                            displayedComponents: .date,
                            label: {
                                Text("Data Pagamento")
                            }
                        )
                        Toggle("Pago", isOn: $statusPay)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    }
                    Section {
                        Picker(
                            "Responsável pelo pagamento",
                            selection: $responsible) {
                                ForEach(Flavor.allCases) { flavor in
                                    Text(flavor.rawValue.capitalized)
                                }
                            }
                            .pickerStyle(MenuPickerStyle()
                        )
                    }
                    Section {
                        Toggle("Christian", isOn: $statusPay)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Toggle("Raona", isOn: $statusPay)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        Toggle("Marcelo", isOn: $statusPay)
                            .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    } header: {
                        Text("Contribuintes")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            // mandar para a home screen?
                        } label: {
                            Text("Salvar")
                                .font(.system(.body, design: .rounded).weight(.medium))
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancelar")
                                .font(.system(.body, design: .rounded).weight(.medium))
                        }
                    }
                }
            }
            .navigationTitle("Adicionar Despesa")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}
