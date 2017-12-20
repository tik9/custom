class T {
	// 0 nicht mit 3 kombinieren,1 nur mit 2

	public static void main(String[] args) {

		int[][] arr = new int[17][4];
		for (int i = 0; i <= 3; i++) {
			for (int j = 1; j <= 16; j++) {
				if (i == 3 && j % 2 == 0)
					arr[j][3] = 1;
				if (j >= 9)
					arr[j][0] = 1;

				for (int k = 3; k <= 15; k += 4) {
					arr[k][2] = 1;
					arr[k + 1][2] = 1;
				}
				for (int l = 5; l <= 8; l++) {
					arr[l][1] = 1;
				}
				for (int l = 13; l <= 16; l++) {
					arr[l][1] = 1;
				}

				System.out.println(j + " " + i + " " + arr[j][i]);
			}
		}

		int[] arr2 = new int[17];

		for (int i = 2; i <= 16; i++) {
			arr2[i] = 1;
			if (arr[i][0] == 1 && arr[i][3] == 1)
				arr2[i] = 0;
			if (arr[i][1] == 1 && arr[i][2] != 1)
				arr2[i] = 0;
			System.out.println(i + " " + arr2[i]);
		}
	}
}