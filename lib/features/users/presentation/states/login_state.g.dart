// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginState _$LoginStateFromJson(Map<String, dynamic> json) => _LoginState(
  email: json['email'] as String? ?? '',
  password: json['password'] as String? ?? '',
  isLoading: json['isLoading'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String? ?? '',
  isLoggedIn: json['isLoggedIn'] as bool? ?? false,
);

Map<String, dynamic> _$LoginStateToJson(_LoginState instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'isLoggedIn': instance.isLoggedIn,
    };
