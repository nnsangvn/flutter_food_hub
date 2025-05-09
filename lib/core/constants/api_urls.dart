class ApiUrls {
  static const baseURL = 'http://localhost:8080/';
  static const register = '${baseURL}api/v1/auth/register';
  static const verifyCode = '${baseURL}api/v1/auth/verify-code';
  static const resendCode = '${baseURL}api/v1/auth/verify-email';
}
