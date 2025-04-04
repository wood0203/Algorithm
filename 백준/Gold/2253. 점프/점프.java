import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
	
	static int N;
	static int[] rocks;
	static int[][] dp;
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] nm = br.readLine().split(" ");
		N = Integer.parseInt(nm[0]);
		int M = Integer.parseInt(nm[1]);
		rocks = new int[N + 1];
		dp = new int[N + 1][1000];
		for (int i = 0; i < M; i++) {
			int cant = Integer.parseInt(br.readLine());
			rocks[cant] = -1;
		}

		for (int i = 1; i <= N; i++) {
			for (int j = 0; j < 1000; j++) {
				dp[i][j] = Integer.MAX_VALUE;
			}
		}
		dp[1][0] = 0;
		
		for (int i = 1; i <= N; i++) {
			for (int velocity = 0; velocity < 1000; velocity++) {
				if (dp[i][velocity] == Integer.MAX_VALUE) continue;

				if (velocity > 1 && (i + velocity - 1) <= N && rocks[i + velocity - 1] != -1) {
					dp[i + velocity - 1][velocity - 1] = Integer.min(dp[i][velocity] + 1, dp[i + velocity - 1][velocity - 1]);
				}
				if (i + velocity <= N && rocks[i + velocity] != -1) {
					dp[i + velocity][velocity] = Integer.min(dp[i][velocity] + 1, dp[i + velocity][velocity]);
				}
				if ((i + velocity + 1) <= N && rocks[i + velocity + 1] != -1) {
					
					dp[i + velocity + 1][velocity + 1] = Integer.min(dp[i + velocity + 1][velocity + 1], dp[i][velocity] + 1);
				}
			}
		}

		int answer = Integer.MAX_VALUE;
		for (int i = 1; i < 1000; i++) {
			if (dp[N][i] == -1) continue;
			answer = Integer.min(answer, dp[N][i]);
		}
		
		if (answer == Integer.MAX_VALUE) {
			System.out.println(-1);
		} else {
			System.out.println(answer);
		}
	}
}