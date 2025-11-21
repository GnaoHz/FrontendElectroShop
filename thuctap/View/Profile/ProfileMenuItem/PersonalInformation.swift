import SwiftUI

struct PersonalInformation: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    let genders = ["Male", "Female", "Other"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            InputField(title: "Full Name",
                       placeholder: "Enter your name",
                       text: Binding(
                        get: { profileViewModel.profile.fullName },
                           set: { profileViewModel.profile.fullName = $0 }
                       )
            )
            
            InputField(title: "Phone",
                       placeholder: "Enter your phone number",
                       text: Binding(
                           get: { profileViewModel.profile.phoneNumber ?? "" },
                           set: { profileViewModel.profile.phoneNumber = $0 }
                       )
            )
            
            Text("Date of Birth")
                .font(.system(size: 20, weight: .regular))
                .padding(.leading, 20)
            
            DatePicker("",
                       selection: Binding(
                           get: { profileViewModel.profile.dateOfBirth ?? Date() },
                           set: { profileViewModel.profile.dateOfBirth = $0 }
                       ),
                       displayedComponents: .date
            )
            .datePickerStyle(.compact)
            .labelsHidden()
            .padding(.leading, 20)
            
            Text("Gender")
                .font(.system(size: 20, weight: .regular))
                .padding(.leading, 20)
            
            Picker("", selection: Binding(
                get: { profileViewModel.profile.gender.rawValue.capitalized },
                set: { newValue in
                    profileViewModel.profile.gender = Gender(rawValue: newValue) ?? .other
                }
            )) {
                ForEach(genders, id: \.self) { g in
                    Text(g).tag(g)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 20)
            
            Spacer(minLength: 20)
        }
    }
}
#Preview {
    PersonalInformation()
        .environmentObject(ProfileViewModel())
        .environmentObject(UserViewModel())
}

