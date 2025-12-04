import SwiftUI
struct aAddressView: View {
    @StateObject var locationService = LocationService()
    
    var body: some View {
        VStack {
            if let c = locationService.coordinate {
                Text("Lat: \(c.latitude)")
                Text("Lng: \(c.longitude)")

                Button("Gửi lên server") {
                    sendCoordinatesToServer(lat: c.latitude, lng: c.longitude)
                }
            } else {
                Text("Đang lấy vị trí…")
            }
        }
    }

    func sendCoordinatesToServer(lat: Double, lng: Double) {
        let url = URL(string: "https://your-domain.com/api/reverse")!
        let body: [String: Any] = ["lat": lat, "lng": lng]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { _,_,_ in
            print("Đã gửi lat/lng lên server")
        }.resume()
    }
}
