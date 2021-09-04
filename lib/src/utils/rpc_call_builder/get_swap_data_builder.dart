import 'package:equatable/equatable.dart';

class GetSwapDataResponse extends Equatable{
  final BigInt amount;
  final double priceImpact;
  GetSwapDataResponse({
    required this.amount,
    required this.priceImpact,
  });

  @override
  List<Object?> get props => [
    amount,
    priceImpact,
  ];
}