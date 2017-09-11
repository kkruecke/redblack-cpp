#ifndef rb_tree_23423590
#define rb_tree_23423590

#include <memory>
#include <utility>
#include <ostream>
#include <exception>
#include <initializer_list>
#include <queue>


template<class Key, class Value> class rbtree;        // Fwd declarations
template<typename Key, typename Value> class Node; 

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
        
       std::ostream& print(std::ostream& ostr) const noexcept
       {
          ostr << "{" << pair().first << ',' <<  pair().second <<  "}, ";
          return ostr;
       }

       friend std::ostream& operator<<(std::ostream& ostr, const KeyValue& key_value) { return key_value.print(ostr); }
   };
 
   enum class child_index { left = 0, right = 1 };

 public:

   class Node {
      private:

       friend class rbtree<Key, Value>;             

        KeyValue key_value;

        bool black; // red or black flag

        Node *parent; /* parent is only used for navigation of the tree. It does not own the memory */

        std::unique_ptr<Node> left; 
        std::unique_ptr<Node> right; 

        bool is_red() const noexcept   { return !black; }  
        bool is_black() const noexcept { return black; }

        std::unique_ptr<Node>& Child(child_index index) { index == child_index::left ? left : right; }

        std::unique_ptr<Node>& operator[] (child_index index) { return getChild(index); }

        void connectChild(child_index childNum, std::unique_ptr<Node>& child) noexcept;
        
        /*
         * Removes child node (implictly using move ctor) and shifts its children to fill the gap. Returns child pointer.
         */  
        std::unique_ptr<Node> disconnectChild(child_index child) noexcept { return Child(child); } // TODO: Should this shift keys and child? 

        explicit Node(Key small, const Value& value, Node *parent=nullptr) noexcept;
        explicit Node(const KeyValue& key_value, Node *parent=nullptr) noexcept;
        explicit Node(const Node& node, Node *parent_ptr) noexcept;
        explicit Node(Node&& node) noexcept;
 
        constexpr const Node *getParent() const noexcept { return parent; }
  
      public: 
        constexpr Key key() { return key_value.key(); } 
        constexpr Key& key() const { return key_value.key(); } 

        constexpr Value& value() { return key_value.value(); } 
        constexpr const Value& value() const { return key_value.value(); } 

        std::ostream& print(std::ostream& ostr) const noexcept 
        {
           return key_value.print(ostr);
        }  
   
        friend std::ostream& operator<<(std::ostream& ostr, const Node& node)
        { 
           return node.print(ostr);
        }
   };
   
 private: 

   std::unique_ptr<Node> root;

    // implementations of the public depth-frist traversal methods    
    template<typename Functor> void DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& root) const noexcept;

    template<typename Functor> void DoPostOrderTraverse(Functor f,  const std::unique_ptr<Node>& root) const noexcept;

    template<typename Functor> void DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& root) const noexcept;

    void destroy_tree(std::unique_ptr<Node> &root) noexcept; 
    
    void clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const Node *parent) noexcept; // called by copy ctor

    const Node *findNode(Key key, const Node *current) const noexcept; 

 public:
     
    using value_type      = std::pair<const Key, Value>; 
    using difference_type = long int;
    using pointer         = value_type*; 
    using reference       = value_type&; 
    using node_type       = Node; 

    rbtree() : root{nullptr} {}

    rbtree(std::initializer_list<value_type> list) noexcept; 

    explicit rbtree(const rbtree&) noexcept; 

    rbtree(rbtree&& lhs) noexcept : root{std::move(lhs.root)} {} // move constructor

    rbtree clone() const noexcept;

    rbtree& operator=(const rbtree&) noexcept; 

    rbtree& operator=(rbtree&&) noexcept; // move assignment

    int getHeight() const noexcept;
 
    bool isEmpty() const noexcept;

    /* 
       TODO:
       See http://en.cppreference.com/w/cpp/container/map/operator_at for how operator[] should be implemented
     */
    const Value& operator[](Key key) const;
    
    Value& operator[](Key key);
    
    // If key does not exist, at() does not insert it unlike operator[]
    Value& at( const Key& key );
	
    const Value& at( const Key& key ) const;
   
    void insert(Key key, const Value& value) noexcept;

    void remove(Key key) noexcept;

    std::pair<bool, const Node *> find(Key key) const noexcept;
    
    // Breadth-first traversal
    template<class Functor> void levelOrderTraverse(Functor f) const noexcept;

    // Depth-first traversals
    template<typename Functor> void inOrderTraverse(Functor f)   const noexcept { return DoInOrderTraverse(f, root);   }
    template<typename Functor> void preOrderTraverse(Functor f)  const noexcept { return DoPreOrderTraverse(f, root);  }
    template<typename Functor> void postOrderTraverse(Functor f) const noexcept { return DoPostOrderTraverse(f, root); }
};

template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value(key, value), parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true} 
{
}

template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true} 
{
}

template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr} 
{
}

template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent} 
{

}

template<class Key, class Value> void rbtree<Key, Value>::Node::connectChild(typename rbtree<Key, Value>::child_index child, std::unique_ptr<typename rbtree<Key, Value>::Node>& node_ptr) noexcept 
{
  // TODO: Should this move the current child left or right, as appropriate?
  Child(child) = std::move(node_ptr);

  if (child != nullptr) {

      child->parent = this;
  }
}

template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
{
   if (current == nullptr) {

      return;
   }

   f(*current); 

   DoPreOrderTraverse(f, current->left);

   DoPreOrderTraverse(f, current->right);
}

template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPostOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
{
   if (current == nullptr) {

      return;
   }

   DoPostOrderTraverse(f, current->left);

   DoPostOrderTraverse(f, current->right);

   f(*current); //  f(const rbtree<Key, Value>::Node&)
}

template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
{
   if (current == nullptr)  return;

   DoInOrderTraverse(f, current->left);
  
   f(*current); // invokes Functor::operator()(const Node&) 

   DoInOrderTraverse(f, current->right);
}

// Breadth-first traversal. Useful for display the tree (with a functor that knows how to pad with spaces based on level).
template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::levelOrderTraverse(Functor f) const noexcept
{
   std::queue< std::pair<const Node*, int> > queue; 

   Node* proot = root.get();

   if (proot == nullptr) return;
      
   auto initial_level = 1; // initial, top root level is 1.
   
   // 1. pair.first  is: const tree<Key, Value>::Node23*, the current node to visit.
   // 2. pair.second is: current level of tree.
   queue.push(std::make_pair(proot, initial_level));

   while (!queue.empty()) {

        std::pair<const Node *, int> pair_ = queue.front();

        const Node *current = pair_.first;

        int current_tree_level = pair_.second;

        f(*current, current_tree_level);  
        
        if (current != nullptr && !current->isLeaf()) {
    
            queue.push(std::make_pair(current->left.get(), current_tree_level + 1));  
            queue.push(std::make_pair(current->right.get(), current_tree_level + 1));  
        }

        queue.pop(); 
   }
}


template<class Key, class Value> inline rbtree<Key, Value>::rbtree(const rbtree<Key, Value>& lhs) noexcept 
{ 
  destroy_tree(); // free all the nodes of the current tree 

  // Traverse in pre-order cloning each node in lhs.
  clone_tree(lhs.root, root, nullptr);
}

template<class Key, class Value> inline rbtree<Key, Value> rbtree<Key, Value>::clone() const noexcept
{
  rbtree new_tree;
  clone_tree(root, new_tree.root, nullptr);
  return new_tree;
}

// Do pre-order recursive traversal, cloning the source node but using the parent that is passed in.
template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
{
  if (src == nullptr) return;
  
  dest = std::make_unique<Node>(src, parent);
  
  clone_tree(src->left, dest->left, dest.get());
  clone_tree(src->right, dest->right, dest.get());
}
 
/*
 * destroy_tree(unique_ptr<Node>&) does a post order tree traversal, using recursion and deleting nodes as they are visited. 
 */
template<class Key, class Value> void rbtree<Key, Value>::destroy_tree(std::unique_ptr<Node> &current) noexcept 
{
  if (current == nullptr) return;
  
  destroy_tree(current->left);
  destroy_tree(current->right);

  current.reset(); // deletes the underlying raw pointer. 
}

template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(const rbtree<Key, Value>& lhs) noexcept
{
  if (this == &lhs) return *this;
  
  destroy_tree(); // free all the nodes of the current tree 

  // Traverse in pre-order cloning each node in lhs.
  clone_tree(lhs.root, root, nullptr);

  return *this;
}

template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
{
  if (this == &lhs) return *this;
  
  destroy_tree(); // free all the nodes of the current tree 

  root = std::move(lhs.root);

  return *this;
}

template<class Key, class Value> const typename rbtree<Key, Value>::Node *rbtree<Key, Value>::findNode(Key key, const Node *current) const noexcept
{
  while (current != nullptr && key != current->key()) {

      current = (key < current->key()) ? current->left.get() : current->right.get(); 
  }
  
  return current;
}

/*
  return a pair, in which "first" is true, if found, and "second" points to the found node; otherwise, <false, nullptr> is returned.
 */
template<class Key, class Value> inline std::pair<bool, const typename rbtree<Key, Value>::Node *> rbtree<Key, Value>::find(Key key) const noexcept
{ 
    const Node *node = findNode(key, root.get());

    return std::make_pair(node != nullptr, (node != nullptr) ? node : nullptr); 
}

template<class Key, class Value> void rbtree<Key, Value>::insert(Key key, const Value& value) noexcept
{
    
}

template<class Key, class Value> void rbtree<Key, Value>::remove(Key key) noexcept
{
    
}

template<class Key, class Value> inline const Value& rbtree<Key, Value>::at(const Key& key) const 
{
  const Node *pnode = findNode(key, root.get());
  
  if (pnode == nullptr) throw std::out_of_range("Key not found in tree");
  
  return pnode->value();
}

template<class Key, class Value> inline Value& rbtree<Key, Value>::at(const Key& key)
{
  return this->at(key);
}

template<class Key, class Value> const Value& rbtree<Key, Value>::operator=(const Key& key) const 
{

}

template<class Key, class Value> inline Value& rbtree<Key, Value>::operator=(const Key& key)
{
  if (pnode == nullptr) {

      insert(key, Value{});
  } 
  
  return;
}

#endif
