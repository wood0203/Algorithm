import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.PriorityQueue;

public class Main {
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N = Integer.parseInt(br.readLine());
		PriorityQueue<Integer> queue = new PriorityQueue<>();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < N; i++) {
			int x = Integer.parseInt(br.readLine());
			if (x == 0) {
				Integer p = queue.poll();
				if (p == null) {
					sb.append(0).append("\n");
				} else {
					sb.append(p).append("\n");
				}
			} else {
				queue.offer(x);
			}
			
			
		}
		System.out.println(sb.toString());
	}

}
