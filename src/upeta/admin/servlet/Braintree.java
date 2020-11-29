package upeta.admin.servlet;

import java.math.BigDecimal;

import com.braintreegateway.BraintreeGateway;
import com.braintreegateway.CustomerRequest;
import com.braintreegateway.Environment;
import com.braintreegateway.Result;
import com.braintreegateway.Transaction;
import com.braintreegateway.TransactionOptionsRequest;
import com.braintreegateway.TransactionRequest;
import com.braintreegateway.ValidationErrors;
 
public class Braintree {
 
private static BraintreeGateway gateway = null;
private static String publicKey = "YOUR_PUBLIC_KEY";
private static String privateKey = "YOUR_PRIVATE_KEY";
private static String merchantId= "YOUR_MERCHANT_ID";
 
public static void main(String[] args) {
      gateway = connectBraintreeGateway();
      braintreePaymentProcessing();
 }
 
// Connect to Braintree Gateway.
public static BraintreeGateway connectBraintreeGateway() {
         BraintreeGateway braintreeGateway = new BraintreeGateway(
                 Environment.SANDBOX, merchantId, publicKey, privateKey);
         return braintreeGateway;
 }
 
public static void braintreePaymentProcessing() {
        String clientToken = generateClientToken();
        String nonceFromTheClient = getPaymentMethodNonce();
     // Receive payment method nonce from client and do payment transactions
        BigDecimal amount = new BigDecimal("5.10");
        doPaymentTransaction(nonceFromTheClient, amount);
 }
 
// Make an endpoint which return client token(Generate at server side) to client.
public static String generateClientToken() {
        String clientToken = gateway.clientToken().generate();
        return clientToken;
 }
 
public static String getPaymentMethodNonce() {
        String nonceFromTheClient =  "fake-consumed-nonce";
        return nonceFromTheClient;
 }
 
// Make an endpoint which receive payment method nonce from client and do payment transaction.
public static void doPaymentTransaction(String paymentMethodNonce, BigDecimal amount) {
        TransactionRequest request = new TransactionRequest();
        request.amount(amount);
        request.paymentMethodNonce(paymentMethodNonce);
       
        setCustomerInTransaction(request);
        SetTransactionRequestOptions(request);
        executePaymentTransaction(request);
 }
 
private static void setCustomerInTransaction(TransactionRequest request) {
         CustomerRequest customerRequest = request.customer();
         customerRequest.email("enquiry@surekhatech.com");
         customerRequest.firstName("Surekha");
         customerRequest.lastName("Technologies");
 }
 
 private static TransactionOptionsRequest SetTransactionRequestOptions(TransactionRequest request) {
         TransactionOptionsRequest options = request.options();
         options.submitForSettlement(true);
         
         // Complete transaction request
         options.done();
         return options;
 }
 
 private static void executePaymentTransaction(TransactionRequest request) {
          // Create transaction.
          Result<Transaction> result = gateway.transaction().sale(request);
          boolean isSuccess = result.isSuccess();
          if (isSuccess) {
                  Transaction transaction = result.getTarget();
                  // Further process on transaction
          } else {
                  ValidationErrors errors = result.getErrors();
                  // Error handling as per your requirement
          }
      }
 }
