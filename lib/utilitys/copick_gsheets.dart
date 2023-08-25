import 'package:gsheets/gsheets.dart';

class CopickGsheetsConfig {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "ctg-app-80208",
  "private_key_id": "6394e2837c1a59f20674f1d7ed7cbc877add8bd6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDFdfxm0yCIlL61\nVvOHvqsb43/PnzR4Fo2Oc2HRsmRhhLeXLpbz+RpOTnASiOAEfI1bqGkU0MTb9d9o\nsrjZx1beBF13HJgLYdX/DvDQWgl0b+v32JIuy+3XQy+Ch6K4VJdPZkgAkW52n5D3\nrEevGb7oqFQ7eh/8G3GM4THI40yOEuXt9uyw7bdcqxCA1a1CIQ+GB2bqMDKk4OUP\nOiaJQ0MpklawsWoAIgU79bL9c/mw+qSDuAXWFxYxpS4ammy4M++nldYuP58VtXb5\nzVx6zbTfczvfvuKEzEJQbDLrP0UgnHFdilxyvTsxZN7bum7SNqs2KrGtsJp1EWvz\nIA7NoAWLAgMBAAECggEATJSirBpLrszJXbj4P/gxkmJb6mDbT4unoMyc7l/aUHvR\nW//EqaA9lIsVKgsNno/Tnu2ku17wSkKEP624xTVrOjXFLfHYAeoSvZXEzXlt20ug\n34GNyDps5qR244/JCuY7vJ51ZEsC5VyjM3sMXhuFD+RgrqSBjRvzoOihj0CgKyT4\nqT7hPtb0xetHsh4fepbDvfwVrHzBYAwJ6+oQtiP7PIKGmyubk2FThyi1+XjLXQZz\nVIdrJCiCdcBC67gPqSObrU/dUcH/PxobUqYtnLxVrAWOxmWsV66rSu05ddSlXSfG\nbFtyf9mqfXJ3ugK9F95UALccjV/8adyvaYCEbos1+QKBgQDo0JaPjTyptDRmiS4y\n0xQGaBz7FZm1GTkHjvKpSsvyJlixFMH4I8C9Axa+jPEROYb4le+ej10x7KaoN49r\n2VxPj4JMXVSk63jF4yQLbOD/QCq24CMQmLWQXAIvTF63MCOVoOW0jYkZ5edPWpvJ\ndOb69sjUw5leb4FqVCO6jGRIzwKBgQDZIBSRLJfd/6VunoI/AwviUnFjslGPHPNB\nJNNc5AM2dTZfUdfzCMxrPNOprFdjfOHtGt4cpaNauUIURmIfU4DoRVMJM1FwikpI\n4EHqMzOfTyNYh/LlItHdBECNzD2JhQ2GeeCQxu+EI+2W8+z9bY2cxyloHVd8YiIe\nOT/Fmr8uhQKBgQCMr7e76ZpV5rqfl5geSGVadcHFjMkEochPo/dJjBRwMPH5mFSa\nkWhgD6TH4z2trfi88UYKqBGmIJ6ZGnIFtyTMQyl24hNLUav60QawDMxuEqV9OzaV\nSeK16JO9Z0X5JxLp0X/duoW167L6xgNMGuOVllnIEKb2ZSVsTooEqd/UCwKBgQDK\nIkeDb5RipCEK/p4as2dY54+QVO4A4d7EgtgS3mLvS+e2jacRJtvH6fTTPRKOGDDs\nX9rvqHSPfXC7F1s59q9HjWJkalYjA1tsxPoYYlposXAid031a5kcvVyrpbyUTj3t\nN4GMxucsiZYitiunM1pm3jL6LnbH4UQKBxoLiKj7UQKBgQCpy9S0yrkE/0Wtstcc\n4QB6trxkCRy2IP0WtsYA9FawWpMrO5SOyjreegR396O37eIXwyZAMdRYSRnmhubd\niYL0hHukSpdHObS9pKWG1tR3h5XRcxMWYTqWso42d/+EdZ133aunJBPn+XgxS7Ha\nm53xcO7t5qMkfPq5gpyCQNGXvg==\n-----END PRIVATE KEY-----\n",
  "client_email": "ctg-app-80208@appspot.gserviceaccount.com",
  "client_id": "118285736162956964267",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ctg-app-80208%40appspot.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';
  static final copickGsheets = GSheets(_credentials);
}
