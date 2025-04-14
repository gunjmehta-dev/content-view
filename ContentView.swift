import SwiftUI

struct ContentView: View {
    // Variables for form data
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    @State private var isSubmitted = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Message", text: $message)
                }

                Section {
                    Button(action: {
                        // Action for form submission
                        isSubmitted = true
                    }) {
                        Text("Submit")
                    }
                }
            }
            .navigationBarTitle("Contact Us")
            .alert(isPresented: $isSubmitted) {
                Alert(title: Text("Thank you!"),
                      message: Text("Your message has been sent successfully.\n\nName: \(name)\nEmail: \(email)\nMessage: \(message)"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
