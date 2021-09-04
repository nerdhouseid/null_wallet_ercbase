import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';

import '../../../ercbase.dart';
import '../smartcontract.dart';
part 'get_token0_address_builder.g.dart';
class GetToken0AddressBuilder extends RpcCallBuilder{
  final String lpAddress;
  GetToken0AddressBuilder({
    required this.lpAddress,
  }) : super(
    contract: DeployedContract(
      ContractAbi.fromJson(SmartContract.pairFactoryJsonAbi, 'Pair'),
      EthereumAddress.fromHex(lpAddress),
    ),
    contractAddress: lpAddress,
    function: 'token0',
    parameters: [],
  );
  GetToken0AddressBuilder copyWith({
    String? lpAddress,
  }){
    return GetToken0AddressBuilder(
      lpAddress: lpAddress ?? this.lpAddress,
    );
  }
}
@JsonSerializable()
class GetToken0AddressResponse extends Equatable{
  @JsonKey(defaultValue: ConstantAddres.ZERO_ADDRESS)
  final String token0Address;
  GetToken0AddressResponse({
    required this.token0Address
  });
  factory GetToken0AddressResponse.fromRpc(List<dynamic> json){
    if(json.isEmpty){
      return GetToken0AddressResponse(
        token0Address: ConstantAddres.ZERO_ADDRESS
      );
    }
    return GetToken0AddressResponse(
      token0Address: (json[0] as EthereumAddress).hex,
    );
  }
  factory GetToken0AddressResponse.fromJson(Map<String, dynamic> json) => _$GetToken0AddressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetToken0AddressResponseToJson(this);

  @override
  List<Object?> get props => [
    token0Address,
  ];
}