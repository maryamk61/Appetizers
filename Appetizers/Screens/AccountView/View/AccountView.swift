//
//  AccountView.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 6/22/1402 AP.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var vm = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
      case firstName, lastName, email
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("PERSONAL INFO") {
                    TextField("First Name", text: $vm.user.firstname)
                        .autocorrectionDisabled()
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $vm.user.lastname)
                        .autocorrectionDisabled().focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $vm.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    
                    DatePicker("Birthday", selection: $vm.user.birthdate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)

                    Button {
                        vm.save()
                    } label: {
                        Text("Save Changes")
                            .bold()
                            .padding()
                            .frame(height: 32)
                            .cornerRadius(8)
                            .foregroundColor(Color("brandPrimary"))
                    }
                }
                Section("REQUESTS") {
                    Toggle("Extra Napkins", isOn: $vm.user.needsNapkin)
                 
                    Toggle("Frequent Refills", isOn: $vm.user.frequentRefills)
                }
                .tint(Color("brandPrimary"))
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            vm.fetchuser()
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text(vm.alertItem?.title ?? "") , message: Text(vm.alertItem?.message ?? ""), dismissButton: vm.alertItem?.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
