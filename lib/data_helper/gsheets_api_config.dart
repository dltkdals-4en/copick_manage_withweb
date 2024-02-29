import 'package:gsheets/gsheets.dart';

class GsheetsApiConfig {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "copick-13aa2",
  "private_key_id": "c6c1ecc3a52e29286f5e8cf8030a311520ad733f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5EmWn1Gf+Nn9t\n3+VkQ3vZhaC+nevhNfJGcGbWbvfDWPXsqV/YYeLbWvBPuEoeoNwofKI+Ys/Z+eWM\nIGe4zhTPJy1AmCi4LQQ/FBgN1dHid/0Egc/xz49WCdBgWOcLnBa97HFFxAqPvDsh\nvJR/B4EVf7W6tK4NjmOmvtx0ArDSEdz3HqGWgM01hbwXYfm9QTV+K7ZxxS3w7oip\nFtSWk4WSTdVMBId0+85Z3hTx8vjw7571sGtPpz6nB8eE5YAL5F4T3Sg2h3S0YujZ\nVRNoPYyv7X9z83lGF1PnerRr1aHHmPnTlSwGo1KY6rGaqLYG9oUCFGui8aggNCKA\n/MmjDYdZAgMBAAECggEABkIA/fPIsGfXVzfC4ekGPwytqsRcPXk9f/Q9BfMqnYhc\niGwRuZdVvGUOyyNIHlECILxWIBXnQU+Z22sdFrqhKYABn7WFavTat+dOCOm59xZn\nj8dz6JFEH3yldxyKc3ILstBT5DAEy2dp+HIP81ulmbx/wJhrajnuVK0PdzzADdpO\nCjMmcDAG/QIXikaezrG8PzPMZn8q0PN08HZwwdggO8UGlEqdzh0fDnZlOl3VNHue\n4HNi5TNMw+iwfhrZwUBYQaJcfoLYZS6nPtjlGV/hHnH86G7ry1njCvVBu3O2vRIq\n64hKxEWi1IMBkMHxltlgl4xRdx7QRg9CJ/94HLySgQKBgQDjx5amVEy11M32/2kA\n7JRazm8/xeu6qAM7hhMuCQ8l1Fcbn0r+TgmIQ/4Pe1rgMNQXoj9ZKRPkARm1nu4P\nVuGWufTmOd/E1dw/YoyWNggQyHb146gBrRubaB3EmM//JtdZTuCCoj8FR8+oGfWd\nDg76/8zAnd/SJxUiikPbXd2CZQKBgQDQAEKX/CR5ryYloPb/mDywEMVKC42D6BQ1\nlEyFP8iGG5+Ujhai8e36z+5hy0QLi1VdRGSrf4GRREKWMkm1jBqiJ7Le/4D/WKDz\nsBELQkToOkfwywAenPKqEzLOeL8k2QbxMDvKIrpa7netkscol4Wjx30nY036YK8l\n8P1O0vin5QKBgCA7jCv5XemVNZgwSHGjCNNYxxFlNphxUhPIQ0qOaaBWzgTQo9Ic\nxOiNhpQ2RoPXJQw7H2/EilYHedXjqZhuGPo1UlyJ8ApwoPwvO+m9t6J4W60sDAhA\nsNlrAFtjrHtUycCPkuGph/V9VftZwRH6fVAzhovzS0r30NvUaQnP3JqpAoGAaZeY\nNvvjsHqADR44Be1M8byxyzMuNkZ86+5LImIM9DfVvV6ckz/qJiekxrSf6JRlU6HC\n0WU7a3mRrBn/XVCwvJ0WqypeXEKsAsng/Sw5OwNLPixv9RqL/lcctcCKmLQsWAi6\ncZVLsZnZ253lyO+TAl/lYzeAgJjQkZxTm85yORkCgYAm13reWBNjfpU6O+6QGPCZ\npR8hCOaLGIfVkQavbHIoCOEVK7wGuw176SmR3Oev3co6QCXwZXl7FVkstRHmhZbb\nVlYG6D9MmaVXl0aX0KSYuIhlz39ffarqB3QM3UtAtrZywsC9hglDxUZbrO/v0DOd\nysv+kmp1pwmd0U6sqJabKA==\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-q73s7@copick-13aa2.iam.gserviceaccount.com",
  "client_id": "109051832651845642058",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-q73s7%40copick-13aa2.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';
  static final gsheets = GSheets(_credentials);
  final sheetsData = gsheets.spreadsheet('spreadsheetId');
}
