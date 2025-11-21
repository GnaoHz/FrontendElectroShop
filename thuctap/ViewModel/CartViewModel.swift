
import Foundation

class CartViewModel: ObservableObject {
    @Published var cart: [CartItem] = []
    
    var total: Int {
        cart.reduce(0) { $0 + $1.quantity * $1.product.price }
    }
    
    func add(product:Product){
        if let index = cart.firstIndex(where: {$0.product.id == product.id})
            {
            cart[index].quantity += 1
        }
        else{
            cart.append(CartItem(product: product, quantity: 1))
        }
    }
    func remove(product: Product){
        if let index=cart.firstIndex(where: {$0.product.id==product.id}){
            cart.remove(at: index)
        }
    }
}
