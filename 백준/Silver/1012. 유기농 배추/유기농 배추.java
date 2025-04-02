import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Queue;

public class Main {
	
	static int N, M, answer = 0;
	static int[] dx = { 1, -1, 0, 0 };
	static int[] dy = { 0, 0, -1, 1 };
	static int[][] ground;
	static boolean[][] visited;
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int T = Integer.parseInt(br.readLine());
		StringBuilder sb = new StringBuilder();
		for (int testCase = 0; testCase < T; testCase++) {
			String[] mnk = br.readLine().split(" ");
			M = Integer.parseInt(mnk[0]);
			N = Integer.parseInt(mnk[1]);
			int K = Integer.parseInt(mnk[2]);
			ground = new int[N][M];
			visited = new boolean[N][M];
			for (int j = 0; j < K; j++) {
				String[] ab = br.readLine().split(" ");
				int a = Integer.parseInt(ab[0]);
				int b = Integer.parseInt(ab[1]);
				ground[b][a] = 1;
			}
			
			int cnt = 0;
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < M; j++) {
					if (ground[i][j] == 1 && !visited[i][j]) {
						bfs(i, j);
						cnt++;
					}
				}
			}
			
			sb.append(cnt).append("\n");
		}
		
		System.out.println(sb.toString());
	}

	static void bfs(int i, int j) {
		Queue<int[]> queue = new ArrayDeque<>();
		queue.offer(new int[] { i, j });
		visited[i][j] = true;
		while (!queue.isEmpty()) {
			int[] q = queue.poll();
			for (int k = 0; k < 4; k++) {
				int nx = q[0] + dx[k];
				int ny = q[1] + dy[k];
				if (check(nx, ny) && !visited[nx][ny] && ground[nx][ny] == 1) {
					visited[nx][ny] = true;
					queue.offer(new int[] {nx, ny});
				}
			}
		}
	}

	static boolean check(int x, int y) {
		return (0 <= x && x < N && 0 <= y && y < M);
	}
}

