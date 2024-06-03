import '../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  static String getBaseUrl() {
    return BASE_URL;
  }

  Future<bool> capturePayment(String paymentIntentId, String amountToCapture) async {
    final url = Uri.parse('${getBaseUrl()}/api/capture-payment');
    final response = await http.post(url, body: {
      'paymentIntentId': paymentIntentId,
      'amountToCapture': amountToCapture,
    });
    print("capturePayment: " + response.request.toString());
    if (response.statusCode == 200) {
      print("Payment captured successfully");
      return true;
    } else {
      print("Failed to capture payment");
      return false;
    }
  }

  Future<void> refundItems(String paymentIntentId, String amountToCapture) async {
    final url = Uri.parse('${getBaseUrl()}/api/refund-items');
    final response = await http.post(url, body: {
      'paymentIntentId': paymentIntentId,
      'amountToRefund': amountToCapture,
    });

    print("refundItems: " + response.request.toString());

    if (response.statusCode == 200) {
      print("Payment refund successfully");
    } else {
      print("response: " + response.body.toString());
      print("Failed to refund payment");
    }
  }

  Future<void> cancelFunds(String paymentIntentId) async {
    final url = Uri.parse('${getBaseUrl()}/api/cancel-payment-intent');
    final response = await http.post(url, body: {
      'paymentIntentId': paymentIntentId,
    });

    if (response.statusCode == 200) {
      print("Payment canceled successfully");
    } else {
      print("Failed to cancel payment");
    }
  }
}