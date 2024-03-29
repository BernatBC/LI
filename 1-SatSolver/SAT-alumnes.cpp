#include <iostream>
#include <stdlib.h>
#include <algorithm>
#include <vector>
using namespace std;

#define UNDEF -1
#define TRUE 1
#define FALSE 0

uint numVars;
uint numClauses;
vector<vector<int> > clauses;
vector<int> model;
vector<int> modelStack;
uint indexOfNextLitToPropagate;
uint decisionLevel;

vector<vector<int>> positiveApparences;
vector<vector<int>> negativeApparences;
vector<int> conflicts;

void readClauses( ){
  // Skip comments
  char c = cin.get();
  while (c == 'c') {
    while (c != '\n') c = cin.get();
    c = cin.get();
  }  
  // Read "cnf numVars numClauses"
  string aux;
  cin >> aux >> numVars >> numClauses;
  clauses.resize(numClauses);
  positiveApparences.resize(numVars);
  negativeApparences.resize(numVars);
  // Read clauses
  for (uint i = 0; i < numClauses; ++i) {
    int lit;
    while (cin >> lit and lit != 0) {
      clauses[i].push_back(lit);
      if (lit > 0) positiveApparences[lit - 1].push_back(i);
      else negativeApparences[-lit - 1].push_back(i);
      }
  }
  conflicts.resize(numVars);
  for (uint i = 0; i < numVars; ++i) conflicts[i] = positiveApparences[i].size() + negativeApparences[i].size();
}

int currentValueInModel(int lit){
  if (lit >= 0) return model[lit];
  else {
    if (model[-lit] == UNDEF) return UNDEF;
    else return 1 - model[-lit];
  }
}


void setLiteralToTrue(int lit){
  modelStack.push_back(lit);
  if (lit > 0) model[lit] = TRUE;
  else model[-lit] = FALSE;		
}


bool propagateGivesConflict ( ) {
  while ( indexOfNextLitToPropagate < modelStack.size() ) {
    
    int litToPropagate = modelStack[indexOfNextLitToPropagate];
    vector<int> affectedClausules;
    if (litToPropagate < 0) affectedClausules = positiveApparences[-litToPropagate - 1];
    else affectedClausules = negativeApparences[litToPropagate - 1];

    ++indexOfNextLitToPropagate;
    for (uint i = 0; i < affectedClausules.size(); ++i) {
      uint clausule = affectedClausules[i];
      bool someLitTrue = false;
      int numUndefs = 0;
      int lastLitUndef = 0;
      for (uint k = 0; not someLitTrue and k < clauses[clausule].size(); ++k){
	      int val = currentValueInModel(clauses[clausule][k]);
	      if (val == TRUE) someLitTrue = true;
	      else if (val == UNDEF){ ++numUndefs; lastLitUndef = clauses[clausule][k]; }
      }
      if (not someLitTrue and numUndefs == 0) {
        for (uint k = 0; k < clauses[clausule].size(); ++k) {
          int cl = clauses[clausule][k];
          if (cl < 0) cl = -cl;
          conflicts[cl - 1]++;
        }
        return true; // conflict! all lits false
      }
      else if (not someLitTrue and numUndefs == 1) setLiteralToTrue(lastLitUndef);	
    }    
  }
  return false;
}


void backtrack(){
  uint i = modelStack.size() -1;
  int lit = 0;
  while (modelStack[i] != 0){ // 0 is the DL mark
    lit = modelStack[i];
    model[abs(lit)] = UNDEF;
    modelStack.pop_back();
    --i;
  }
  // at this point, lit is the last decision
  modelStack.pop_back(); // remove the DL mark
  --decisionLevel;
  indexOfNextLitToPropagate = modelStack.size();
  setLiteralToTrue(-lit);  // reverse last decision
}


// Heuristic for finding the next decision literal:
int getNextDecisionLiteral(){
  int maxVal = -1;
  int var = 0;
  for (uint i = 1; i <= numVars; ++i) {
    if (model[i] != UNDEF or conflicts[i - 1] <= maxVal) continue;
    maxVal = conflicts[i - 1];
    var = i;
  }
  return var;
}

void checkmodel(){
  for (uint i = 0; i < numClauses; ++i){
    bool someTrue = false;
    for (uint j = 0; not someTrue and j < clauses[i].size(); ++j)
      someTrue = (currentValueInModel(clauses[i][j]) == TRUE);
    if (not someTrue) {
      cout << "Error in model, clause is not satisfied:";
      for (uint j = 0; j < clauses[i].size(); ++j) cout << clauses[i][j] << " ";
      cout << endl;
      exit(1);
    }
  }  
}

int main(){  
  readClauses(); // reads numVars, numClauses and clauses
  model.resize(numVars+1,UNDEF);
  indexOfNextLitToPropagate = 0;  
  decisionLevel = 0;
  
  // Take care of initial unit clauses, if any
  for (uint i = 0; i < numClauses; ++i)
    if (clauses[i].size() == 1) {
      int lit = clauses[i][0];
      int val = currentValueInModel(lit);
      if (val == FALSE) {cout << "UNSATISFIABLE" << endl; return 10;}
      else if (val == UNDEF) setLiteralToTrue(lit);
    }
  
  // DPLL algorithm
  //int iterations = 5000;
  while (true) {
    while ( propagateGivesConflict() ) {
      if ( decisionLevel == 0) { cout << "UNSATISFIABLE" << endl; return 10; }
      backtrack();
    }
    int decisionLit = getNextDecisionLiteral();
    if (decisionLit == 0) { checkmodel(); cout << "SATISFIABLE" << endl; return 20; }
    // start new decision level:
    modelStack.push_back(0);  // push mark indicating new DL
    ++indexOfNextLitToPropagate;
    ++decisionLevel;
    setLiteralToTrue(decisionLit);    // now push decisionLit on top of the mark
  }
  /*if (iterations <= 0)  {
    iterations = 5000;
    for (uint i = 0; i < numVars; i++) conflicts[i] /= 2;
  }
  --iterations;*/
}  