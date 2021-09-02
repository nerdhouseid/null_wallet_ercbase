enum TransactionType {
  ExecuteSmartContract,
  Approve,
  SendToken,
  SwapToken,
  SwapEthForToken,
  SwapTokenForToken,
  WrapEth,
  UnwrapEth,
}
class ConstantAddres{
  static const String DEAD_ADDRESS = "0x000000000000000000000000000000000000dead";
  static const String ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";
  static const String ONE_ADDRESS = "0x0000000000000000000000000000000000000001";

  static const List<String> INVALID_ADDRESS = [
    DEAD_ADDRESS,
    ZERO_ADDRESS,
    ONE_ADDRESS
  ];
}
class ConstantNumber{
  static const double allowance = 115792089237316195423570985008687907853269984665640564039457584007913129639935.00;
}
class TransactionConstant{
  static const TRANSACTION_CONFIRMED = "Confirmed";
  static const TRANSACTION_FAILURE = "Failed";
  static const TRANSACTION_PENDING = "Pending";
  static const TRANSACTION_MAYBE_PENDING = "Maybe Pending";
  static const TRANSACTION_DROPPED = "Dropped";
  static const GAS_PRICE_LOW = "LOW";
  static const GAS_PRICE_HIGH = "HIGH";
  static const GAS_PRICE_MEDIUM = "MEDIUM";
}
class WalletConstant{
  static const String DERIVATION_PATH = "m/44'/60'/0'/0";
}