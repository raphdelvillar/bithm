class Translator {
  String translate(String language, String value) {
    return translation[language][value];
  }
  
  Map<String, Map<String, String>> translation = {
    "English": en,
    "Tagalog": ph
  };

  static Map<String, String> en = {
    "Interest Calculator": "Interest Calculator",
    "Amount": "Amount",
    "Interest Rate (in %)": "Interest Rate (in %)",
    "How many days?": "How many days?",
    "Result": "Result",
    "Loaned Amount": "Loaned Amount",
    "Payable Amount": "Payable Amount",
    "Payable per day": "Payable per day",
    "Income": "Income",
    "Income per day": "Income per day",
  };

  static Map<String, String> ph = {
    "Interest Calculator": "Calculator ng Interes",
    "Amount": "Halaga",
    "Interest Rate (in %)": "Rate ng Interest (sa %)",
    "How many days?": "Ilang araw?",
    "Result": "Resulta",
    "Loaned Amount": "Hiniram na Halaga",
    "Payable Amount": "Bayad na Halaga",
    "Payable per day": "Bayad kada araw",
    "Income": "Kita",
    "Income per day": "Kita kada araw",
  };
}