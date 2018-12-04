#include "cabezeras.h"

using namespace std;

int main() {

	ifstream inFile;

	vector<long> vec;
	vector<long>::iterator it;

	long freq = 0;
	long aux;

	while (true) {

		inFile.open("C:/Users/victor/source/repos/AdventOfCode2018/Day1/input.txt");
		if (!inFile) {
			cout << "Unable to open file";
			exit(1);
		}

		while (inFile >> aux) {
			freq += aux;
			it = vec.begin();
			while (it != vec.end()) {
				if ((*it) == freq) {
					exit(freq);
				}
				it++;
			}
			vec.push_back(freq);
		}

		inFile.close();
	}

	return 0;
}