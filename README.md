# Puzzles

Run `bundle install` to install all gems.

## rake most_related

Shows 10 most related research interests:

```bash
% rake most_related
Education and Social Sciences                                **************************************************************************
Business and Social Sciences                                 ***************************************************
History and Education                                        *************************************************
History and Social Sciences                                  ******************************************
Sociology and Social Sciences                                *****************************************
Sociology and Education                                      ***************************************
Business and Education                                       *************************************
International Relations and Social Sciences                  *************************************
Philosophy and Education                                     **********************************
History and Philosophy                                       ******************************
```

## rake least_related

Shows 10 least related research interests. Currently uses Dijkstra algorithm to calculate shortests paths between nodes. Simply returns first nodes without paths between them.

```bash
% rake least_related
Advertising and Tourism Management
Advertising and Citizenship
Advertising and Pharmacy
Advertising and Translation theory
Advertising and Logika Dan Algoritma
Advertising and Agriculture
Advertising and Pascal
Advertising and Pharmacology
Advertising and Tourism Studies
Advertising and Direito
```

## Tests

Run `rspec` to execute test suite.
