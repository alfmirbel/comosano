import '../10_user_login/data_models/auth_state.dart';
import '../10_user_login/usuario_login/data_session.dart';

const String GOOGLE_KEY = String.fromEnvironment('GOOGLE_KEY');
const String GOOGLE_MAPS_KEY = String.fromEnvironment('GOOGLE_MAPS_KEY');

AuthState auth = AuthState(
    sessionUserData: SessionData(
  key: '',
  varName: '',
  valueToSave: '',
  userId: '',
  userName: '',
  userPass: '',
  avatarBase64: "",
));
