import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Queue;

public class Main {
	static int N, M, answer = 0;
	static int[] dx = {-1, 1, 0, 0};
	static int[] dy = {0, 0, -1, 1};
	static int[][] box;
	static Queue<int[]> queue = new ArrayDeque<>();
	static boolean[][] visited;

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] nm = br.readLine().split(" ");
		N = Integer.parseInt(nm[1]);
		M = Integer.parseInt(nm[0]);
		box =new int[N][M];
		for (int i = 0; i < N; i++) {
			String[] input = br.readLine().split(" ");
			for (int j = 0; j < M; j++) {
				box[i][j] = Integer.parseInt(input[j]);
			}
		}
		
		

		for (int k = 0; k < 1; k++) {
			visited = new boolean[N][M];
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < M; j++) {
					if (box[i][j] > 0) {
						visited[i][j] = true;
						queue.offer(new int[] {i, j});					}
				}
			}
		}
		bfs();

		for (int i = 0; i < N; i++) {
			for (int j = 0; j < M; j++) {
				if (box[i][j] == 0) {
					answer = -1;
					break;
				}
			}
		}
		
		if (answer >= 0) {
			System.out.println(answer);
		} else {
			System.out.println(-1);
		}
	}
	
	static void bfs() {
		while (!queue.isEmpty()) {
			int[] p = queue.poll();
			for (int k = 0; k < 4; k++) {
				int nx = p[0] + dx[k];
				int ny = p[1] + dy[k];
				if (check(nx, ny) && !visited[nx][ny] && box[nx][ny] == 0) {
					visited[nx][ny] = true;
					box[nx][ny] = box[p[0]][p[1]] + 1;
					answer = Integer.max(answer, box[nx][ny] - 1);
					queue.offer(new int[] {nx, ny});
				}
			}
		}
	}
	
	static boolean check(int x, int y) {
		return (0 <= x && x < N && 0 <= y && y < M);
	}
}
