import 'package:zirudemo/clientengine/form/ZiRuWebForm.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';
import 'package:zirudemo/manager/FormViewManager.dart';

class FormListManager {
  static FormListManager instance;
  static FormListManager getInstance() {
    if (instance == null) {
      instance = FormListManager();
    }
    return instance;
  }

  List<ZRFormState> forms = new List();

  add(ZRFormState form) {
    forms.add(form);
  }

  remove(ZRFormState form) {
    forms.remove(form);
  }

  clear() {
    forms.clear();
  }

  ZRFormState getCurrentForm() {
    return forms.last;
  }

  size() {
    return forms.length;
  }
}

class ZRFormState {
  ZiRuWebForm ziRuWebForm;
  MyWebFormState zrState;
}
