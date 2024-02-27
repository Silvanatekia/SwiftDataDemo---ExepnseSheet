//
//  AddExpenseSheet.swift
//  SwiftDataDemo - ExepnseSheet
//
//  Created by Silvana Tekia on 27/02/2024.
//

import Foundation
import SwiftUI

struct AddExpenseSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("Value", value: $value, format: .currency(code: "GBP"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading ) {
                    Button("Cancel") { dismiss() }
                    
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let expense = Expense(name: name, date: date, value: value)
                        context.insert(expense)
                        dismiss()
                    }
                }
            }
        }
    }
}


