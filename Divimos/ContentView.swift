//
//  ContentView.swift
//  Divimos
//
//  Created by Francisco Misael Landero Ychante on 26/11/19.
//  Copyright © 2019 Francisco Misael Landero Ychante. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var cantidadApagar = ""
    @State private var Personas = ""
    @State private var porcentajePropina = 2
    
    var numeroDePersonas: Int {
        let numero  =  Int(Personas) ?? 1
        return numero
    }
    
    var totalPorPersona : Double {
        let contarPersonas = Double(numeroDePersonas)
        let propinaSeleccionada = Double(porcentajeDePropinas[porcentajePropina])
        let totalApagar = Double(cantidadApagar) ?? 0 //Convertimos nuestro texto a decimal pero si falla usaremos cero.
        
        let valorDelaPropina = totalApagar/100 * propinaSeleccionada
        let granTotal = totalApagar + valorDelaPropina
        let cantidadPorPersona = granTotal/contarPersonas
    
        return cantidadPorPersona
    }
    
    var TotalconPropina : Double {
           let propinaSeleccionada = Double(porcentajeDePropinas[porcentajePropina])
           let totalApagar = Double(cantidadApagar) ?? 0 //Convertimos nuestro texto a decimal pero si falla usaremos cero.
           
           let valorDelaPropina = totalApagar/100 * propinaSeleccionada
           let granTotal = totalApagar + valorDelaPropina
       
           return granTotal
       }
    
    let porcentajeDePropinas = [10,15,20,25,0]
    var body: some View {
        NavigationView{
            NavigationView {
            Form {
                Section {
                    TextField("Total a pagar", text: $cantidadApagar)
                        .keyboardType(.decimalPad)
                    
                    TextField("Personas", text: $Personas)
                        .keyboardType(.numberPad)
                }
                
                Section (header: Text("¿Que porcentaje de propina desea dejar?")) {
                    Picker("Porcetanje de propina", selection: $porcentajePropina){
                        ForEach(0 ..< porcentajeDePropinas.count){
                            Text("\(self.porcentajeDePropinas[$0])%")
                        }
                    
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total con propina")) {
                                   Text("El total a pagar es $\(TotalconPropina, specifier: "%.2f")")
                                    .foregroundColor(TotalconPropina <= 0 ? .red : .black)
                               }
                
                Section(header: Text("Total a pagar por persona")) {
                    Text("Cada quien debe pagar $\(totalPorPersona, specifier: "%.2f")")
                }
            }
            
        .navigationBarTitle("Dividamos 🍽")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
