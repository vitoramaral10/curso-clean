import 'package:curso_clean/ui/pages/login/login_presenter.dart';

import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

LoginPresenter makeLoginPresenter() => StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation(),
    );
