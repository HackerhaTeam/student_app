import 'package:student_hackerha/core/api/keys/discount/discount_keys.dart';
import 'package:student_hackerha/features/courses/domain/Entity/discount.dart';

class DiscountModel extends Discount {
  DiscountModel({required super.dis, required super.rate});
  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
        dis: json[DiscountKeys.dis], rate: json[DiscountKeys.rate]);
  }
}
