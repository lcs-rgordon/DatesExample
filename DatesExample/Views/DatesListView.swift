//
//  DatesListView.swift
//  DatesExample
//
//  Created by Russell Gordon on 2024-06-12.
//

import SwiftUI

struct DatesListView: View {
    
    // MARK: Stored properties
    
    // Tracks data provided by the user
    @State private var firstName: String = ""
    @State private var providedDate: Date = Date()
    
    // Access the view model
    @State private var viewModel = DateListViewModel()
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    TextField("What's your name?", text: $firstName)
                    DatePicker("Pick a date", selection: $providedDate)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // Add a new person and a date they selected
                            let newPerson = Person(
                                firstName: firstName,
                                providedDate: providedDate
                            )
                            // TODO: Make this work again with the database
                            //people.insert(newPerson, at: 0) // Add new person at top of list
                        } label: {
                            Text("Add")
                        }
                        .padding(.top, 10)
                    }

                }
                .padding()
                
                List(viewModel.people) { currentPerson in
                    VStack(alignment: .leading) {
                        Text(currentPerson.firstName)
                            .bold()
                        Text("\(currentPerson.providedDate.formatted(date: .long, time: .standard))")
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
