//
//  PaymentView.swift
//  MovieBooking
//
//  Created by Antoni on 02/04/20.
//  Copyright © 2020 Antonilhin. All rights reserved.
//

import SwiftUI

struct PaymentView: View {
    
    private let paymentMethods = PaymentMethod.allCases
    @State private var selectedMethod  = PaymentMethod.MasterCard
    @State private var cardholderName  = ""
    @State private var cardNumber  = ""
    @State private var expireDate  = ""
    @State private var cvv  = ""
    @State private var formYOffset: CGFloat = 0
    @State private var isSendingPending = false
    @State private var paymentSent = false
    
    private let okView = OkView(width: 30, lineWidth: 7)
    private let loadingView = LoadingView(lineWidth: 7)
    
    var body: some View {
        
        SubscriptionView(content:  createNavigationContent(), publisher: NotificationCenter.keyboardEvent ) { rect in
            withAnimation {
                self.formYOffset = rect.height > 0 ? -230 : 0
            }
        }
    }
    
    fileprivate func createPopupContent() -> some View {
        return VStack {
            if paymentSent{
                self.okView.transition(.hearbeat)
                Text( "Success!").foregroundColor(.gray).padding()
            } else {
                self.loadingView.frame(width: 50, height: 50).transition(.scale)
                Text( "Validating...").foregroundColor(.gray).padding()
            }
        }.frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
            .padding()
            .background(Color.background.opacity(0.7))
            .cornerRadius(20)
            .shadow(color: Color.textColor.opacity(0.3), radius: 20, x: 0, y: 10)
            .transition(.move(edge: .bottom))
    }
    
    fileprivate func createNavigationContent() -> some View{
        return NavigationView{
            Form{
                createPaymentMethodSection()
                createDetailsSection()
            }.navigationBarTitle("Payment", displayMode: self.formYOffset == 0 ? .large : .inline)
                .offset(y: self.formYOffset)
                .blur(radius: self.isSendingPending ? 7 : 0).overlay(
                    VStack{
                        if self.isSendingPending {
                            createPopupContent()
                        } else {
                            EmptyView()
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background( self.isSendingPending ? Color.background.opacity(0.3) : .clear)
            )
        }
    }
    
    fileprivate func createPaymentMethodSection() -> some View{
        return Section(header: Text("Select payment method").font(.system(size: 20, weight: Font.Weight.semibold)) ) {
            Picker("", selection: self.$selectedMethod) {
                ForEach(paymentMethods, id: \.self){ method in
                    Text(method.rawValue).tag(method)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
        }
    }
    
    fileprivate func createDetailsSection() -> some View{
        let isPaypal = selectedMethod == PaymentMethod.Paypal
        
        return Section(header: Text("Credit card details").font(.system(size: 20, weight: Font.Weight.semibold)) ,
                       footer: LCButton(text: "Pay", action: {
                        self.simulatePayment()
                       }) ) {
                        LCTextfield(value: self.$cardholderName, placeholder: isPaypal ? "Username" : "Cardholder Name", leadingIcon: Image(systemName: "person"))
                        HStack {
                            LCTextfield(value: self.$cardNumber, placeholder:  isPaypal ? "Password" : "Card Number", leadingIcon: Image(systemName: isPaypal ? "lock" : "number"), isSecure: isPaypal)
                            Image(self.selectedMethod.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                        }
                        
                        if !isPaypal{
                            LCTextfield(value: self.$expireDate, placeholder: "Expire Date", leadingIcon: Image(systemName: "calendar"))
                            LCTextfield(value: self.$cvv, placeholder: "CVV", leadingIcon: Image(systemName:  "lock"))
                        }
        }
    }
    
    fileprivate func simulatePayment() {
        
        if !cardNumber.isEmpty
            && !expireDate.isEmpty
            && !cardholderName.isEmpty
            && !cvv.isEmpty{
            self.isSendingPending = true
            
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                withAnimation {
                    self.paymentSent = true
                }
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    withAnimation {
                        self.isSendingPending = false
                    }
                }
            }
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
