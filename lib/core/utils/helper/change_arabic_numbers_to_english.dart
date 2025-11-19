extension ArabicNumberConversion on String {
  String toEnglishNumbers() {
    const arabicNumerals = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    return split('').map((char) => arabicNumerals[char] ?? char).join();
  }
}
