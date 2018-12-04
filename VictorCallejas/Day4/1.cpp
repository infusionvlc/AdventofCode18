#include "cabezeras.h"

using namespace std;


struct Order {
	int mes;
	int dia;
	int hora;
	int minuto;
	int ord; //-2 se duerme, -1 se despierta, id del sguardia being shifted
};

struct Guardia {
	int id;
	int minutos_totales;
	vector<int> minutos;
};

string trim(const string& str)
{
	size_t first = str.find_first_not_of(' ');
	if (string::npos == first)
	{
		return str;
	}
	size_t last = str.find_last_not_of(' ');
	return str.substr(first, (last - first + 1));
}


int main() {

	ifstream inFile;

	vector<string> ordenes_str;
	vector<Order> ordenes;
	vector<Guardia> guardias;;
	vector<int> aux;
	for (int i = 0; i <= 59; i++) { aux.push_back(0); }

	int m, d, h, min, ord;
	char c;
	string line, aux_ord;

	inFile.open("C:/Users/victor/source/repos/AdventOfCode2018/Day4/input.txt");
	if (!inFile) {
		cout << "Unable to open file";
		exit(1);
	}

	struct Order Or;

	while (getline(inFile, line)) {
		ordenes_str.push_back(line);
	}

	inFile.close();

	sort(ordenes_str.begin(), ordenes_str.end());

	for (int i = 0; i < ordenes_str.size(); i++) {

		m = stoi(ordenes_str[i].substr(6, 2));
		d = stoi(ordenes_str[i].substr(9, 2));
		h = stoi(ordenes_str[i].substr(12, 2));
		min = stoi(ordenes_str[i].substr(15, 2));

		if (ordenes_str[i][19] == 'w') {
			ord = -1;
		}
		else if (ordenes_str[i][19] == 'f') {
			ord = -2;
		}
		else {
			aux_ord = ordenes_str[i].substr(26, 4);
			ord = stoi(trim(aux_ord));
		}

		Or = { m,d,h,min,ord };

		ordenes.push_back(Or);

	}

	map<int, int> pos;
	map<int, int>::iterator it;
	pair<int, int> aux_pair;


	for (int i = 0; i < ordenes.size(); i++) {
		if (ordenes[i].ord >= 0) {
			it = pos.find(ordenes[i].ord);
			if (it == pos.end()) {
				struct Guardia g = { ordenes[i].ord, 0, aux };
				guardias.push_back(g);
				aux_pair = pair<int, int>(g.id, guardias.size() - 1);
				pos.insert(aux_pair);
			}
		}
	}

	int guardia_actual;
	int min_pasado;

	for (int i = 0; i < ordenes.size(); i++) {
		if (ordenes[i].ord > 0) {
			guardia_actual = ordenes[i].ord;
		}
		else if (ordenes[i].ord == -2) {
			min_pasado = ordenes[i].minuto;
		}
		else {
			it = pos.find(guardia_actual);
			for (int j = min_pasado; j <= ordenes[i].minuto; j++) {
				guardias[(it->second)].minutos_totales++;
				guardias[(it->second)].minutos[j]++;
			}

		}
	}

	int max_id = guardias[0].id;
	int max_min_total = guardias[0].minutos_totales;

	for (int i = 1; i < guardias.size(); i++) {
		if (guardias[i].minutos_totales > max_min_total) {
			max_id = guardias[i].id;
			max_min_total = guardias[i].minutos_totales;
		}
	}

	it = pos.find(max_id);
	int max_min = guardias[it->second].minutos[0];
	int pos_max_min = 0;

	for (int i = 1; i <= 59; i++) {
		if (guardias[it->second].minutos[i] > max_min) {
			max_min = guardias[it->second].minutos[i];
			pos_max_min = i;
		}
	}


	cout << max_id * pos_max_min << endl;


	return 0;
}