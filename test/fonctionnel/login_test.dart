import 'package:bloc_test/bloc_test.dart';
import 'package:dog_app_bloc/bloc/login/login_bloc.dart';
import 'package:dog_app_bloc/bloc/login/login_event.dart';
import 'package:dog_app_bloc/bloc/login/login_state.dart';
import 'package:dog_app_bloc/repositories/login_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  MockLoginRepository? mockLoginRepository;
  setUp(() {
    mockLoginRepository = MockLoginRepository();
  });
  group('copyWith Test', () {
    test('test all', () {
      LoginState state = LoginState();
      state = state.copywith(
        token: '',
        emailError: FieldError.empty,
        isBusy: true,
        passwordError: FieldError.valid,
      );
      expect(state.emailError, FieldError.empty);
      expect(state.token, '');
      expect(state.isBusy, true);
      expect(state.passwordError, FieldError.valid);
    });
  });
  group(
    'test email regex',
    () {
      blocTest(
        'testing with empty email',
        build: () => LoginBloc(LoginState(), repository: mockLoginRepository!),
        act: (LoginBloc bloc) => bloc.add(LoginEventEmailChanged('')),
        expect: () => [LoginState(emailError: FieldError.empty)],
      );

      blocTest(
        'testing with valid email',
        build: () => LoginBloc(LoginState(), repository: mockLoginRepository!),
        act: (LoginBloc bloc) => bloc.add(LoginEventEmailChanged('benjamin@minel.fr')),
        expect: () => [LoginState(emailError: FieldError.valid)],
      );

      blocTest(
        'testing with invalid email',
        build: () => LoginBloc(LoginState(), repository: mockLoginRepository!),
        act: (LoginBloc bloc) => bloc.add(LoginEventEmailChanged('minel.fr')),
        expect: () => [LoginState(emailError: FieldError.invalid)],
      );
    },
  );
}
