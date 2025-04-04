import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
  // dp 배열
  static int[] factorialDp;
  static int[] dcDp;

  public static void main(String[] args) throws IOException {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    String[] nk = br.readLine().split(" ");
    int n = Integer.parseInt(nk[0]);
    int k = Integer.parseInt(nk[1]);
    factorialDp = new int[n + 1];
    factorialDp[1] = 1;
    dcDp = new int[10006];

    // n! * ((n - r)! * r!) ^ (p - 2) => 정답
    System.out.println(factorial(n) % 10007 * dc(factorial(n - k) * factorial(k), 10005) % 10007);
  }

  static int factorial(int n) {
    if (n == 1 || n == 0) {
      return 1;
    }

    if (factorialDp[n] != 0) {
      return factorialDp[n];
    }

    factorialDp[n] = (n * factorial(n - 1) % 10007);
    return factorialDp[n];
  }

  // 분할 정복용 함수
  // return fn(n / 2) * fn(n / 2)
  static int dc(int value, int n) {
    if (n == 0)
      return 1;

    if (n == 1) {
      dcDp[1] = value % 10007;
      return dcDp[1];
    }

    if (dcDp[n] != 0)
      return dcDp[n];

    if (n % 2 == 0) {
      dcDp[n] = (dc(value, n / 2) % 10007 * dc(value, n / 2)) % 10007;
      return dcDp[n];
    } else {
      int top = n - 1;
      dcDp[n] = value % 10007 * dc(value, top / 2) % 10007 * dc(value, top / 2) % 10007;
      return dcDp[n];
    }
  }
}
