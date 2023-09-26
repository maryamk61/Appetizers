//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI

struct AppetizerListView: View {
    let manager  = NetworkManager.shared
    @StateObject var vm = AppetizerListViewModel()
   
    
    var body: some View {
        ZStack {
            NavigationStack {
                List {
                    ForEach(vm.appetizers) { appetizer in
                        AppetizerListRowView(appetizer: appetizer)
                            
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                vm.showDetailsView = true
                                vm.selectedAppetizer = appetizer
                            }
                    }
                }
                .navigationTitle("Appetizers 🍟")
                .listStyle(.plain)
                .alert(isPresented: $vm.showErrorAlert) {
                    Alert(title: Text(vm.errorTitle), message: Text(vm.errorMessage), dismissButton: .cancel(Text("Ok")))
                }
            }
            .blur(radius: vm.showDetailsView ? 20 : 0)
            .disabled(vm.showDetailsView)
            if vm.isLoading {
                ProgressView()
                    .tint(Color("brandPrimary"))
            }
            // Details card view
            if vm.showDetailsView && vm.selectedAppetizer != nil {
                AppetizeDetailsView(showDetailsView: $vm.showDetailsView, appetizer: vm.selectedAppetizer!)
            }
        }
       
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppetizerListView()
                .preferredColorScheme(.dark)
            AppetizerListView()
                        
        }
    }
}
