String? latlngVal(text) {
  if (text == null || text.isEmpty) {
    return '값을 입력해주세요.';
  } else if (!RegExp(
          r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$')
      .hasMatch(text)) {
    return '형식이 맞지 않습니다.';
  }
  return null;
}

