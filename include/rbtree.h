#ifndef _rb_tree_23423590
#define _rb_tree_23423590

#include <memory>
#include <utility>
#include <ostream>

// fwd declarations
template<class Key, class Value> class rbtree;
template<typename Key, typename Value> class Node; 
template<typename Key, typename Value> union KeyValue; 

template<typename Key, typename Value> class rbtree {
    
 private:

   union KeyValue { // A union is used to hold to two types of pairs, one of which (pair) has a non-const Key; the other has a const Key.
       friend class rbtree<Key, Value>;
   
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
 
   enum class child_index { left = 0, right = 1 };

   class Node {

       friend class rbtree<Key, Value>;             

        KeyValue key_value;

        bool black; // red/black flag

        Node *parent; /* parent is only used for navigation of the tree. It does not own the memory */

        std::unique_ptr<Node> left; 
        std::unique_ptr<Node> right; 

        bool is_red()  { return !black; }  
        bool is_black() { return black; }

        std::unique_ptr<Node>& Child(child_index index) {  index == child_index::left ? left : right; }

        std::unique_ptr<Node>& operator[] (child_index index) {  return getChild(index); }
  
        explicit Node(Key small, const Value& value, Node *parent=nullptr) noexcept;
        explicit Node(const KeyValue& key_value, Node *parent=nullptr) noexcept;
        explicit Node(Node&& node) noexcept;
 
        constexpr const Node *getParent() const noexcept { return parent; }
  
        constexpr Key key() { return key_value.key(); } 
        constexpr Key& key() const { return key_value.key(); } 

        constexpr Value& value() { return key_value.value(); } 
        constexpr const Value& value() const { return key_value.value(); } 

        std::ostream& print(std::ostream& ostr) const noexcept 
        {
           return ostr << "{ " << key << ", " << value << "} ";
        }  
   
        friend std::ostream& operator<<(std::ostream& ostr, const Node& node)
        { 
           return node.print(ostr);
        }
 
        void connectChild(child_index childNum, std::unique_ptr<Node>& child) noexcept;

        /*
         * Removes child node (implictly using move ctor) and shifts its children to fill the gap. Returns child pointer.
         */  
        std::unique_ptr<Node> disconnectChild(int child_index) noexcept; 
 
   };
   
 private:
   std::unique_ptr<Node> root;

 public:

   rbtree() : root{nullptr} {}
};

template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true} 
{
}

template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true} 
{

}

template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent} 
{

}
template<class Key, class Value> void rbtree<Key, Value>::Node::connectChild(typename rbtree<Key, Value>::child_index childNum, std::unique_ptr<typename rbtree<Key, Value>::Node>& node_ptr) noexcept 
{
  std::unique_ptr<Node>& child = Child(childNum);
  child = std::move(node_ptr);

  if (child != nullptr) {

      child->parent = this;
  }
}
#endif
