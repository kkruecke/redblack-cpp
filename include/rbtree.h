#ifndef _rb_tree_23423590
#define _rb_tree_23423590

// sources: github, bookmarks, stl source code.

template<class Key, class Value> 
class redblack_tree {
// fwd declarations
template<typename Key, typename Value> class tree234;    
template<typename Key, typename Value> class Node234; 
template<typename T> class BasicTreePrinter; 

class DebugPrinter; 
    
template<typename Key, typename Value> class tree234 {
    
   union KeyValue { // A union is used to hold to two types of pairs, one of which (pair) has a non-const Key; the other has a const Key.
       friend class tree234<Key, Value>;
   
       std::pair<Key, Value>        _pair;  // ...this eliminates constantly casting of const_cast<Key>(p.first) = some_noconst_key;
       std::pair<const Key, Value>  constkey_pair;  // but always return this member of the union.

       KeyValue() {} 
       KeyValue(Key key, const Value& value) : _pair{key, value} {}
       
       KeyValue(const KeyValue& lhs) : _pair{lhs._pair.first, lhs._pair.second} {}
       
       KeyValue(Key k, Value&& v) : _pair{k, std::move(v)} {} 
   
       KeyValue(KeyValue&& lhs) :  _pair{move(lhs._pair)} {}
   
       KeyValue& operator=(const KeyValue& lhs) noexcept;  
       KeyValue& operator=(KeyValue&& lhs) noexcept; 

       constexpr Key&  key()  { return _pair.first; }
       constexpr const Key& key() const { return constkey_pair.first; }

       constexpr Value&  value()  { return _pair.second; }
       constexpr const Value& value() const { return constkey_pair.second; }

     public:    
       constexpr const std::pair<Key, Value>& pair() const { return _pair; }
       constexpr std::pair<Key, Value>& pair() { return _pair; }
        
       friend std::ostream& operator<<(std::ostream& ostr, const KeyValue& key_value)
       {
          ostr << "{" << key_value._pair.first << ',' <<  key_value._pair.second <<  "}, ";
          return ostr;
       }
   };
 
  public:
      
   class Node234 { // public nested node class Tree<Key, Value>::Node234
     private:  
       friend class tree234<Key, Value>;             
       friend class DebugPrinter;
       static const int MAX_KEYS;   

       enum class NodeType : int { two_node=1, three_node=2, four_node=3 };
    
       Node234 *parent; /* parent is only used for navigation of the tree. It does not own the memory
                           it points to. */
    
       int totalItems; /* If 1, two node; if 2, three node; if 3, four node. */   
    
       std::array<KeyValue, 3> keys_values; // This implementation does not have an associated value for the key.
       
       /*
        * For 2-nodes, children[0] is left pointer, children[1] is right pointer.
        * For 3-nodes, children[0] is left pointer, children[1] the middle pointer, and children[2] the right pointer.
        * And so on for 4-nodes.
        */
    
       std::array<std::unique_ptr<Node234>, 4> children;
       
       constexpr Node234 *getParent() noexcept; 
       int getChildIndex() const noexcept;
    
       /* 
        * Returns true if key is found in node and sets index so pNode->keys_values[index] == key
        * Returns false if key is if not found, and sets next to the next in-order child.
        */
       bool SearchNode(Key key, int& index, int& child_index, Node234 *&next) noexcept;
    
       void insert(KeyValue&& key_value, std::unique_ptr<Node234>& newChild) noexcept;

       int insertKeyValue(Key key, const Value& value) noexcept;
       
       // Remove key, if found, from node, shifting remaining keys_values to fill its gap.
       KeyValue removeKeyValue(int index) noexcept; 
    
       void connectChild(int childNum, std::unique_ptr<Node234>& child) noexcept;
             /*
        * Removes child node (implictly using move ctor) and shifts its children to fill the gap. Returns child pointer.
        */  
       std::unique_ptr<Node234> disconnectChild(int child_index) noexcept; 
    
       void insertChild(int childNum, std::unique_ptr<Node234> &pChild) noexcept;
    
       /* 
        * Called during remove(Key keym, Node234 *).
        * Merges the 2-node children of a parent 2-node into the parent, making the parent a 4-node. The parent, then, adopts the "grand children", and the children
        * after having been adopted by the parent are deallocated. 
        */
       Node234 *fuseWithChildren() noexcept; 
       
        public:
             
           Node234() noexcept;

           explicit Node234(Key small, const Value& value, Node234 *parent=nullptr) noexcept;

           explicit Node234(const KeyValue& key_value, Node234 *parent=nullptr) noexcept;

           explicit Node234(const KeyValue&, const KeyValue&, Node234 *parent=nullptr) noexcept;
           
           explicit Node234(const KeyValue&, const KeyValue&,  const KeyValue&, Node234 *parent=nullptr) noexcept;

           explicit Node234(KeyValue&& key_value) noexcept; 
           
           constexpr const Node234 *getParent() const noexcept;

           std::ostream& test_2node_invariant(std::ostream& ostr, const Node234 *root) const noexcept; 

           std::ostream& test_3node_invariant(std::ostream& ostr, const Node234 *root) const noexcept;

           std::ostream& test_4node_invariant(std::ostream& ostr, const Node234 *root) const noexcept;

    	   std::ostream& test_parent_ptr(std::ostream& ostr, const Node234 *root) const noexcept;
    
           std::ostream& test_height(std::ostream& ostr) const noexcept;
    
           constexpr int getTotalItems() const noexcept;
           constexpr int getChildCount() const noexcept;

           constexpr const Node234 *getRightMostChild() const noexcept { return children[getTotalItems()].get(); }

           // method to help in debugging
           void printKeys(std::ostream&);

           constexpr Key& key(int i ) { return keys_values[i].key(); } 

           constexpr const Key& key(int i ) const { return keys_values[i].key(); } 

           int getIndexInParent() const;

           constexpr Value& value(int i ) { return keys_values[i].value(); } 
           const Value& value(int i ) const { return keys_values[i].value(); } 
    
           bool findKey(Key key, int& index) const noexcept;
           constexpr Key getKey(int i) const;
           constexpr bool isLeaf() const noexcept; 
           constexpr bool isTwoNode() const noexcept;
           constexpr bool isThreeNode() const noexcept;
           constexpr bool isFourNode() const noexcept;
           constexpr bool isEmpty() const noexcept; 

           std::ostream& print(std::ostream& ostr) const noexcept;
   
           friend std::ostream& operator<<(std::ostream& ostr, const Node234& node234)
           { 
             return node234.print(ostr);
           }
  }; // end class Tree<Key, Value>::Node234  

 private:

 
     class Node {

         friend class rbtree<Key, Value>;             

          KeyValue key_value;
          bool flag; // red/black flag
          bool isRed();  
          bool isBlack();
          Node *parent; /* parent is only used for navigation of the tree. It does not own the memory */
          std::unique_ptr<Node> left; 
          std::unique_ptr<Node> right; 
   
     };

     std::unique_ptr<Node> root;

     public:

};
#endif
