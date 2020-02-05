#include "include/rbtree.h"
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) 
{
    rbtree<int, int> tree;
    
    tree.insert(1, 1);
    
    auto x = tree.at(1);
    
    return 0;
}

