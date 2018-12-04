#include "cabezeras.h"

using namespace std;

int main()
{
	string x;
	ifstream inFile;
	bool t2, t3;
	int times2 = 0, times3 = 0;
	map<char, int> mymap;
	map<char, int>::iterator it;
	pair<char, int> aux_pair;

	inFile.open("C:/Users/victor/source/repos/AdventOfCode2018/Day2/input.txt");
	if (!inFile) {
		cout << "Unable to open file";
		exit(1);
	}
	while (getline(inFile, x)) {
		t2 = false, t3 = false;
		mymap.clear();

		for (int i = 0; i < x.length(); i++) {
			it = mymap.find(x[i]);
			if (it == mymap.end()) {
				aux_pair = make_pair(x[i], 1);
				mymap.insert(aux_pair);
			}
			else {
				it->second++;
			}
		}

		it = mymap.begin();
		int valor;
		while (it != mymap.end()) {

			valor = it->second;

			if (valor == 2) {
				t2 = true;
			}

			if (valor == 3) {
				t3 = true;
			}

			it++;
		}

		if (t2) {
			times2++;
		}
		if (t3) {
			times3++;
		}
	}

	inFile.close();

	cout << "Val = " << times2 * times3 << endl;

	return 0;

}