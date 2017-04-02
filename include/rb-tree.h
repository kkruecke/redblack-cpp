#ifndef _rb_tree_23423590
#define _rb_tree_23423590

// sources: github, bookmarks, stl source code.

template<class Key, class Value> 
class redblack_tree {

     struct Node {

        std::pair<Key, Value> pr;
        std::unique_ptr<Node> left;
        std::unique_ptr<Node> right;

        bool is_red;

       

     };

     public:

};
#endif
