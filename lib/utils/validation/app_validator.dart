class AppValidator {
  static requiredField(String text, {String? errorMsg}) =>
      text.isEmpty ? errorMsg ?? "Kolom tidak boleh kosong" : null;

  static checkFieldPass(String text) {
    if (text.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (text.length < 6) {
      return "Tidak boleh kurang dari 6 karakter";
    } else {
      return null;
    }
  }

  static checkFieldMatchPass(String text1, String text2) {
    if (text1.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (text1.length < 6) {
      return "Tidak boleh kurang dari 6 karakter";
    } else if (text1 != text2) {
      return "Password tidak cocok";
    } else {
      return null;
    }
  }

  static checkNama(String text) {
    const pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    final regExp = RegExp(pattern);
    if (text.isEmpty) {
      return "Nama tidak boleh kosong";
    } else if (text.length < 3) {
      return "Harap masukkan nama lengkap anda";
    } else if (regExp.hasMatch(text.trim())) {
      return "Nama tidak boleh mengandung angka atau simbol";
    } else {
      return null;
    }
  }

  static checkEmail(String text) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);
    if (text.isEmpty) {
      return "Email tidak boleh kosong";
    } else if (!regExp.hasMatch(text.trim())) {
      return "Format email salah";
    } else {
      return null;
    }
  }

  static checkNumberPhone(String text) {
    const pattern = r'(^(?:[+]62)?([0-9]|[-]){10,16}$)';
    final regExp = RegExp(pattern);
    if (text.isEmpty) {
      return "Nomor handphone tidak boleh kosong";
    } else if (!regExp.hasMatch(text.trim())) {
      return "Masukkan format nomor HP yang valid";
    } else {
      return null;
    }
  }
}
