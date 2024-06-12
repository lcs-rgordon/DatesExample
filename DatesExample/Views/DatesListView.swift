//
//  DatesListView.swift
//  DatesExample
//
//  Created by Russell Gordon on 2024-06-12.
//

import SwiftUI

struct DatesListView: View {
    
    // MARK: Stored properties
    @State private var name: String = ""
    @State private var providedDate: Date = Date()
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    TextField("What's your name?", text: $name)
                    DatePicker("Pick a date", selection: $providedDate)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // TODO: Add the date
                        } label: {
                            Text("Add")
                        }
                        .padding(.top, 10)
                    }

                }
                .padding()
                
                List {
                    VStack(alignment: .leading) {
                        Text("Russell Gordon")
                            .bold()
                        Text("\(Date().formatted(date: .long, time: .standard))")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Nick Barbour")
                            .bold()
                        Text("\(Date().formatted(date: .long, time: .standard))")
                    }
                }
            }
            .navigationTitle("Dates Example")
        }
    }
}

#Preview {
    DatesListView()
}
