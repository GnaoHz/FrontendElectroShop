

import SwiftUI

struct IntroView: View {
    @ObservedObject var introViewModel: IntroViewModel
    @State private var showLogo: Bool = false
    @State private var showText: Bool = false
    @State private var showTagline: Bool = false
    @State private var showButton: Bool = false

    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(showLogo ? 1 : 0.6)
                .opacity(showLogo ? 1 : 0.1)
                .animation(.easeInOut(duration: 1),value: showLogo)
            
            Text("TTG SHOP")
                .font(.custom("QwitcherGrypen-Bold", size: 70))
                .offset(y: showText ? 0 : 40)
                .opacity(showText ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(1),value: showText)
            
            Text("Chào mừng bạn đến với TTG SHOP")
                .font(.system(size: 23))
                .padding(.top, 12)
                .opacity(showTagline ? 1 : 0)
                .animation(.easeInOut(duration: 1).delay(2), value: showTagline)
            
            Spacer()
            
            Button(action:{
                introViewModel.goToLogin()
            }){
                HStack{
                    Text("Tiếp tục")
                        .font(.system(size: 22,weight: .bold))
                    Image(systemName: "arrowshape.right.fill")
                }
            }
            .padding(16)
            .background(Color.customGreen)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(showButton ? 1 : 0)
            .animation(.easeInOut(duration: 1).delay(3), value: showButton)
            
            Spacer()
        }
        .onAppear {
            showLogo = true
            showText=true
            showTagline=true
            showButton=true
        }
    }
}

#Preview {
    IntroView(introViewModel: IntroViewModel(authCoordinator: AuthCoordinator(appCoordinator: AppCoordinator(isLoggedIn: false))))
}
