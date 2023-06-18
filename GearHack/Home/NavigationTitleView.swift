import SwiftUI

struct NavigationTitleView: View {
    var body: some View {
        HStack {
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Image("ProfilePicture")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .padding(.horizontal, 30)
    }
}
