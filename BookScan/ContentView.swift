//
//  ContentView.swift
//  BookScan
//
//  Created by Peter Richardson on 11/29/21.
//

import SwiftUI

struct ContentView: View {
    @State var isbn: String = ""
    @State var json: String = "JSON Goes Here"
    
    var body: some View {
        VStack {
            TextField(
                    "Scan an ISBN",
                    text: $isbn
                )
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .onSubmit {
                    validate(isbn: isbn)
                }
                .disableAutocorrection(true)
            Text(json)
            Spacer()
            Divider()
        }
    }

    func validate(isbn: String) {
        LoC.lookup(isbn: isbn) { bookinfo in
            json = bookinfo
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
