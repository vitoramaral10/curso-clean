import 'package:curso_clean/ui/pages/login/login_presenter.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../usecases/usecases.dart';
import 'login.dart';


LoginPresenter makeLoginPresenter() => StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation(),
    );
