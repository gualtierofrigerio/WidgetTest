//
//  ContentView.swift
//  WidgetTest
//
//  Created by Gualtiero Frigerio on 18/09/2020.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @State private var text:String = ""
    private let appGroupName = "group.com.gfrigerio.WidgetTest"
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter text:", text: $text)
                Button("Update Widget") {
                    updateWidget(withText: text)
                }
            }
        }
    }
    
    func updateWidget(withText:String) {
        let defaults = UserDefaults.init(suiteName: appGroupName )
        defaults?.set(withText, forKey: "Text")
        defaults?.synchronize()
        
        WidgetCenter.shared.reloadAllTimelines()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
