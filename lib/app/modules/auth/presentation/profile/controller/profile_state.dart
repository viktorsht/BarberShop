import '../../../domain/states/logged_state.dart';

final class ProfileInitial implements UserAppState{}
final class ProfileLoading implements UserAppState{}
final class ProfileError implements UserAppState{}
final class ProfileSucess implements UserAppState{}