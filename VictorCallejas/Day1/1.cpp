#include "cabezeras.h"

using namespace std;

int main() {

	ifstream inFile;

	int count = 0;
	int aux;

	inFile.open("C:/Users/victor/source/repos/AdventOfCode2018/Day1/input.txt");
	if (!inFile) {
		cout << "Unable to open file";
		exit(1);
	}

	while (inFile >> aux) {
		count += aux;
	}

	inFile.close();

	cout << count;

	return 0;
}