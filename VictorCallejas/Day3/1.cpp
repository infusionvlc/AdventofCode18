#include "cabezeras.h"

using namespace std;

int main()
{
	ifstream inFile;

	std::vector<int> x;  int x_aux;
	std::vector<int> y;   int y_aux;
	std::vector<int> w;  int w_aux;
	std::vector<int> h;   int h_aux;
	char c;
	std::vector<vector<int> > matrix;
	std::vector<int> aux;

	int count = 0;

	inFile.open("C:/Users/victor/source/repos/AdventOfCode2018/Day3/input.txt");
	if (!inFile) {
		cout << "Unable to open file";
		exit(1);
	}

	while (inFile >> c >> x_aux >> c >> x_aux >> c >> y_aux >> c >> w_aux >> c >> h_aux) {
		x.push_back(x_aux);
		y.push_back(y_aux);
		w.push_back(w_aux);
		h.push_back(h_aux);
	}
	inFile.close();

	for (int j = 0; j < 1000; j++) {
		aux.push_back(0);
	}
	for (int i = 0; i < 1000; i++) {
		matrix.push_back(aux);
	}



	for (int i = 0; i < x.size(); i++) {
		for (int j = y[i]; j < (h[i] + y[i]); j++) {
			for (int k = x[i]; k < (w[i] + x[i]); k++) {
				matrix[j][k]++;
			}
		}
	}


	for (int i = 0; i < 1000; i++) {
		for (int j = 0; j < 1000; j++) {
			if (matrix[i][j] >= 2) {
				count++;
			}
		}
	}


	cout << "Val = " << count << endl;

	return 0;
}
