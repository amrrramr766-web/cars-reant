part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;
  const factory AuthState.authenticated() = _AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = _AuthStateUnauthenticated;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.error(String message) = _AuthStateError;
}
