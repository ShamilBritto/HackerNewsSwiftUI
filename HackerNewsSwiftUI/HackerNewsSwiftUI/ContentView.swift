//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by GGS-BKS on 11/01/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var hitsArray : [Hits] = []
    var body: some View {
        Text("Hacker News")
        List(hitsArray) { hit in
            Text(hit.title ?? "")
        }
               .onAppear() {
                   Api().loadData { response in
                           self.hitsArray = response.hits ?? []
                   }
               }.navigationTitle("Hacker News")
       }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
