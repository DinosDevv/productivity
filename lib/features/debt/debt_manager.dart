int totalDebt = loadDebt(); // This will be saved in a hivebox (tracked in minutes or seconds? I will decide)

// These are the functions that communicate with the HiveFunctions Class

int loadDebt() {
  return 0; // This will be the content of the storage box
}
int saveDebt() {
  return 0;
}

/*
  I'm thinking of having a setDebt() function that hard-sets the debt duration 
*/

void setDebt(int m) {
  totalDebt = m;
}

