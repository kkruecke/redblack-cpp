#ifndef _rb_tree_23423590
#define _rb_tree_23423590


template<class Key, class Value> 
class redblack_tree {
// fwd declarations
template<typename Key, typename Value> class tree234;    
template<typename Key, typename Value> class Node234; 
template<typename T> class BasicTreePrinter; 

class DebugPrinter; 
    
template<typename Key, typename Value> class tree234 {
    
 private:

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
 
   class Node {

       friend class rbtree<Key, Value>;             

        KeyValue key_value;

        bool is_red; // red/black flag

        Node *parent; /* parent is only used for navigation of the tree. It does not own the memory */

        std::unique_ptr<Node> left; 
        std::unique_ptr<Node> right; 

        bool isRed()  { return is_red; }  
        bool isBlack() { return !is_red; }

        explicit Node(Key small, const Value& value, Node *parent=nullptr) noexcept;
        explicit Node(const KeyValue& key_value, Node *parent=nullptr) noexcept;
 
        constexpr const Node234 *getParent() const noexcept;
  

        constexpr Key key() { return key_value.key(); } 
        constexpr const Key& key() const { return key_value.key(); } 
        constexpr Key& key() const { return key_value.key(); } 

        constexpr Value& key() { return key_value.valuey(); } 
        constexpr const Value& key() const { return key_value.value(); } 

        std::ostream& print(std::ostream& ostr) const noexcept;
   
        friend std::ostream& operator<<(std::ostream& ostr, const Node& node)
        { 
           return node.print(ostr);
        }
 
        void connectChild(int childNum, std::unique_ptr<Node>& child) noexcept;
        /*
         * Removes child node (implictly using move ctor) and shifts its children to fill the gap. Returns child pointer.
         */  
        std::unique_ptr<Node> disconnectChild(int child_index) noexcept; 
 
   };

   std::unique_ptr<Node> root;

   public:

};

template<class Key, class Value> inline rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr=nullptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}
#endif
