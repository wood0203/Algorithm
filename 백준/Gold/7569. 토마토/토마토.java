import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.StringTokenizer;

public class Main {
	static int N, M, H, answer = 0;
	static int[] dx = {-1, 1, 0, 0, 0, 0};
	static int[] dy = {0, 0, -1, 1, 0, 0};
	static int[] dz = {0, 0, 0, 0, -1, 1};
	static int[][][] box;
	static boolean[][][] visited;
	static Queue<int[]> queue = new ArrayDeque<>();	
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] mnh = br.readLine().split(" ");
		N = Integer.parseInt(mnh[1]);
		M = Integer.parseInt(mnh[0]);
		H = Integer.parseInt(mnh[2]);
		box = new int[H][N][M];
		visited = new boolean[H][N][M];
		
		for (int i = 0; i < H; i++) {
			for (int j = 0; j < N; j++) {
				StringTokenizer st = new StringTokenizer(br.readLine());
				for (int k = 0; k < M; k++) {
					box[i][j][k] = Integer.parseInt(st.nextToken());
					if (box[i][j][k] == 1) {
						queue.offer(new int[] {j, k, i});
					}
				}
			}
		}
		
		bfs();
		Outter:
		for (int i = 0; i < H; i++) {
			for (int j = 0; j < N; j++) {
				for (int k = 0; k < M; k++) {
					if (box[i][j][k] == 0) {
						answer = -1;
						break Outter;
					}
				}
			}
		}
		System.out.println(answer);
	}
	
	static void bfs() {
		while (!queue.isEmpty()) {
			int[] p = queue.poll();
			for (int k = 0; k < 6; k++) {
				int nx = p[0] + dx[k];
				int ny = p[1] + dy[k];
				int nz = p[2] + dz[k];
				if (check(nx, ny, nz) && !visited[nz][nx][ny] && box[nz][nx][ny] == 0) {
					visited[nz][nx][ny] = true;
					box[nz][nx][ny] = box[p[2]][p[0]][p[1]] + 1;
					answer = Integer.max(answer, box[nz][nx][ny] - 1);
					queue.offer(new int[] {nx, ny, nz});
				}
			}
		}
	}
	
	static boolean check(int x, int y, int z) {
		return(0 <= x && x < N && 0 <= y && y < M && 0 <= z && z < H);
	}

}
