//
//  ExpenseCell.swift
//  SwiftDataDemo - ExepnseSheet
//
//  Created by Silvana Tekia on 27/02/2024.
//

import Foundation
import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "GBP"))
        }
    }
}
