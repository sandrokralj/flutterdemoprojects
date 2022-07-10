import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'nl'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String nlText = '',
  }) =>
      [enText, nlText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // startPage
  {
    'yu5ry8n1': {
      'en': 'Header One',
      'nl': '',
    },
    '3kprguoq': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'nl': '',
    },
    'iyesgko8': {
      'en': 'Header Two',
      'nl': '',
    },
    'dk4wk83t': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'nl': '',
    },
    'sf3c8se8': {
      'en': 'Header Three',
      'nl': '',
    },
    'gj7rh22z': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'nl': '',
    },
    'c4fcma84': {
      'en': 'Login',
      'nl': '',
    },
    'o1tt6l7y': {
      'en': 'Register',
      'nl': '',
    },
    'sf3olyu1': {
      'en': 'Welcome',
      'nl': '',
    },
    'chfy7dwt': {
      'en': 'Home',
      'nl': '',
    },
  },
  // registerPage
  {
    'ntl1ykie': {
      'en':
          'Create your account by filling in the information below to access the app.',
      'nl': '',
    },
    '7sgq3pfc': {
      'en': 'Your account name',
      'nl': '',
    },
    'fww95o25': {
      'en': 'Enter account name',
      'nl': '',
    },
    '8ifmcu7z': {
      'en': 'Your email address',
      'nl': '',
    },
    'bm9ofgos': {
      'en': 'Enter your email',
      'nl': '',
    },
    'hr636kv7': {
      'en': 'Password',
      'nl': '',
    },
    'sahlpz1v': {
      'en': 'Please enter your password...',
      'nl': '',
    },
    '2h4t1rkj': {
      'en': 'Confirm Password',
      'nl': '',
    },
    '83d5sj2o': {
      'en': 'Please enter your password...',
      'nl': '',
    },
    'imm4jrq6': {
      'en': 'Create Account',
      'nl': '',
    },
    '8m2i5zxs': {
      'en': 'Back',
      'nl': '',
    },
    'vrsuqw7p': {
      'en': 'Create Account',
      'nl': '',
    },
    'm3urq68f': {
      'en': 'Home',
      'nl': '',
    },
  },
  // loginPage
  {
    'n6g4ehp6': {
      'en': 'Back',
      'nl': '',
    },
    'uehvr4k9': {
      'en': 'Login',
      'nl': '',
    },
    'h16tbqu3': {
      'en':
          'Login your account by filling in the information below to access the app.',
      'nl': '',
    },
    'rw7d8sbh': {
      'en': 'Your email address',
      'nl': '',
    },
    '2xm2dctx': {
      'en': 'Enter your email',
      'nl': '',
    },
    '7krxhe0i': {
      'en': 'Password',
      'nl': '',
    },
    'xde3m2a0': {
      'en': 'Please enter your password...',
      'nl': '',
    },
    'k733ie13': {
      'en': 'Forgot password?',
      'nl': '',
    },
    'v9o0sjou': {
      'en': 'Login',
      'nl': '',
    },
    'hfs4zwor': {
      'en': 'Home',
      'nl': '',
    },
  },
  // forgotpasswPage
  {
    'f0tlg9gd': {
      'en': 'Back',
      'nl': '',
    },
    'wzc8f4uc': {
      'en': 'Forgot Password',
      'nl': '',
    },
    '7j8e0ku8': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'nl': '',
    },
    '6fedv9ok': {
      'en': 'Your email address',
      'nl': '',
    },
    '2sr8eqbf': {
      'en': 'Enter your email',
      'nl': '',
    },
    '98sqdhqc': {
      'en': 'Send Link',
      'nl': '',
    },
    'ucvhxngv': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homePage
  {
    '66v1opjh': {
      'en': 'Home',
      'nl': '',
    },
  },
  // tasksPage
  {
    'u97c51yd': {
      'en': '50%',
      'nl': '',
    },
    'h1buynfe': {
      'en': 'Sign the document',
      'nl': '',
    },
    '17z6zls1': {
      'en': 'Print the label',
      'nl': '',
    },
    'tf2idhub': {
      'en': 'Tasks',
      'nl': '',
    },
    'tjh22x6i': {
      'en': 'Tasks',
      'nl': '',
    },
  },
  // signingDocPage
  {
    '7y8cv5jy': {
      'en': 'Submit',
      'nl': '',
    },
    'rhv502yo': {
      'en': 'Sign the document',
      'nl': '',
    },
    'bebztch6': {
      'en': 'Home',
      'nl': '',
    },
  },
  // printLabelPage
  {
    'unxgkmot': {
      'en': 'Printing stuff here',
      'nl': '',
    },
    'rb19uk9w': {
      'en': 'Print Label',
      'nl': '',
    },
    '6jtlwuf4': {
      'en': 'Home',
      'nl': '',
    },
  },
  // settingsPage
  {
    '5oslk1l5': {
      'en': 'Notifications',
      'nl': '',
    },
    'ddev4354': {
      'en': 'Something for notifications',
      'nl': '',
    },
    'fuh9xzke': {
      'en': 'Log out',
      'nl': '',
    },
    '3y67a1sn': {
      'en': 'Settings',
      'nl': '',
    },
    'jpazgieu': {
      'en': 'Settings',
      'nl': '',
    },
  },
  // Miscellaneous
  {
    'n0j4ixvh': {
      'en': '',
      'nl': '',
    },
    'wygsw60u': {
      'en': '',
      'nl': '',
    },
    'vryoa8p1': {
      'en': '',
      'nl': '',
    },
    '5etc4t09': {
      'en': '',
      'nl': '',
    },
    'zfsp3gve': {
      'en': '',
      'nl': '',
    },
    'jby4v2b5': {
      'en': '',
      'nl': '',
    },
    'jeqiax4r': {
      'en': '',
      'nl': '',
    },
    'aqxq52tq': {
      'en': '',
      'nl': '',
    },
    'l0sw4uo1': {
      'en': '',
      'nl': '',
    },
    '7y2r2vjs': {
      'en': '',
      'nl': '',
    },
    '0sru3xq2': {
      'en': '',
      'nl': '',
    },
    'h7lb7ghm': {
      'en': '',
      'nl': '',
    },
    'kjme9gps': {
      'en': '',
      'nl': '',
    },
    'oyuzkjnf': {
      'en': '',
      'nl': '',
    },
    'lb6lnqmi': {
      'en': '',
      'nl': '',
    },
    'haout7p0': {
      'en': '',
      'nl': '',
    },
    'vdvhc20u': {
      'en': '',
      'nl': '',
    },
    'evmuhixd': {
      'en': '',
      'nl': '',
    },
    '8a9med04': {
      'en': '',
      'nl': '',
    },
    'k929hs2f': {
      'en': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
