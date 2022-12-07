//
//  SheetMembers.swift
//  Cashome
//
//  Created by Christian Paulo on 06/12/22.
//

import SwiftUI

struct SheetMembers: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var availableValue = ""

    var body: some View {
        NavigationView {
            VStack {
                Circle()
                    .scale(0.8, anchor: .center)
                    .frame(height: 100)
                    .overlay(
                        Text(name == "" ? "" :  name[0..<1])
                            .foregroundColor(Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                    )
                Form {
                    TextField("Nome", text: $name)
                    TextField("Valor Disponível", text: $availableValue)
                }
            }
            .background(Color("BackgroundPattern"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
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
            .navigationTitle("Adicionar Membro")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
/* primeiro tirar o circle de dentro do form
   segundo aplicar o background na VStack*/
