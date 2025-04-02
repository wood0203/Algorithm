import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Queue;

public class Main {
	
	static int N;
	static int[] dx = {-1, 1, 0, 0};
	static int[] dy = {0, 0, -1, 1};
	static int[][] sections; // 0 -> Red | 1 -> Green | 2 -> Blue
	static boolean[][] visited;
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		N = Integer.parseInt(br.readLine());
		sections = new int[N][N];
		for (int i = 0; i < N; i++) {
			char[] colors = br.readLine().toCharArray();
			for (int j = 0; j < N; j++) {
				int color = 0;
				if (colors[j] == "G".charAt(0)) {
					color = 1;
				} else if(colors[j] == "B".charAt(0)) {
					color = 2;
				}
				sections[i][j] = color;
			}
		}
		
		visited = new boolean[N][N];
		int cnt = 0;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				if (!visited[i][j]) {
					bfs(i, j, false);
					cnt++;
				}
			}
		}
		
		visited = new boolean[N][N];
		int cnt2 = 0;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				if (!visited[i][j]) {
					bfs(i, j, true);
					cnt2++;
				}
			}
		}
		
		System.out.println(cnt + " " + cnt2);
	}
	
	static void bfs(int i, int j, boolean isJeokRok) {
		Queue<int[]> queue = new ArrayDeque<>();
		queue.offer(new int[] {i, j});
		visited[i][j] = true;
		
		while(!queue.isEmpty()) {
			int[] p = queue.poll();
			for (int k = 0; k < 4; k++) {
				int nx = p[0] + dx[k];
				int ny = p[1] + dy[k];
				if (check(nx, ny) && !visited[nx][ny]) {
					if (isJeokRok) {
						if (sections[i][j] == 0 || sections[i][j] == 1) {
							if (sections[nx][ny] != 2) {
								visited[nx][ny] = true;
								queue.offer(new int[] {nx, ny});
							}
						} else {
							if (sections[nx][ny] == 2) {
								visited[nx][ny] = true;
								queue.offer(new int[] {nx, ny});
							}
						}
					} else {
						if (sections[i][j] == sections[nx][ny]) {
							visited[nx][ny] = true;
							queue.offer(new int[] {nx, ny});
						}
					}
				}
			}
		}
	}
	
	static boolean check(int x, int y) {
		return (0 <= x && x < N && 0 <= y && y < N);
	}
}

