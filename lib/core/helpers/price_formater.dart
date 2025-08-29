// lib/core/utils/price_formatter.dart
class PriceFormatter {
  static String formatPrice(num price) {
    if (price >= 1000 && price < 1000000) {
      final thousands = price ~/ 1000;
      return '$thousands ألف';
    } else if (price >= 1000000) {
      final millions = price ~/ 1000000;
      return '$millions مليون';
    } else {
      return price.toString();
    }
  }
  
  static String formatPriceWithCommas(num price) {
    final String priceStr = price.toString();
    final StringBuffer formatted = StringBuffer();
    final int length = priceStr.length;
    
    for (int i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        formatted.write(',');
      }
      formatted.write(priceStr[i]);
    }
    
    return formatted.toString();
  }
}