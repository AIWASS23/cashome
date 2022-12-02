//
//  Sheet.swift
//  Cashome
//
//  Created by Christian Paulo on 01/12/22.
//

import SwiftUI

struct Sheet: View {
    @State private var nome = ""
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Nome",text : $nome)
                    } header: {
                        Text("Testando o nome")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
    //                        report.add(release: Release(title: title, type: selectedFlavor, value: value, date: buy))
    //                        isPresented = false
                        } label: {
                            Text("Salvar")
                                .font(.system(.body, design: .rounded).weight(.medium))
                        }
                        
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button {
    //                        isPresented = false
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
    }
}
