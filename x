"make" -f nbproject/Makefile-Debug.mk QMAKE= SUBPROJECTS= .build-conf
make[1]: Entering directory '/home/kurt/NetBeansProjects/redblack-cpp'
"make"  -f nbproject/Makefile-Debug.mk dist/Debug/GNU-Linux/redblack-cpp
make[2]: Entering directory '/home/kurt/NetBeansProjects/redblack-cpp'
mkdir -p build/Debug/GNU-Linux
rm -f "build/Debug/GNU-Linux/main.o.d"
g++    -c -g -std=c++14 -MMD -MP -MF "build/Debug/GNU-Linux/main.o.d" -o build/Debug/GNU-Linux/main.o main.cpp
In file included from main.cpp:1:0:
include/rbtree.h:131:12: error: expected unqualified-id before ‘)’ token
     rbtree() : root{nullptr} {}
            ^
include/rbtree.h:131:30: error: expected unqualified-id before ‘{’ token
     rbtree() : root{nullptr} {}
                              ^
include/rbtree.h:133:46: error: invalid declarator before ‘list’
     rbtree(std::initializer_list<value_type> list) noexcept;
                                              ^~~~
include/rbtree.h:133:46: error: expected ‘)’ before ‘list’
include/rbtree.h:135:21: error: expected unqualified-id before ‘const’
     explicit rbtree(const rbtree&) noexcept;
                     ^~~~~
include/rbtree.h:135:21: error: expected ‘)’ before ‘const’
include/rbtree.h:137:18: error: expected ‘)’ before ‘&&’ token
     rbtree(rbtree&& lhs) noexcept : root{std::move(lhs.root)} {} // move constructor
                  ^~
include/rbtree.h:137:63: error: expected unqualified-id before ‘{’ token
     rbtree(rbtree&& lhs) noexcept : root{std::move(lhs.root)} {} // move constructor
                                                               ^
include/rbtree.h:169:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:169:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:169:94: error: ‘Node’ is not a type
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                              ^~~~
include/rbtree.h:169:112: error: ISO C++ forbids declaration of ‘Node’ with no type [-fpermissive]
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                ^~~~~~~~
include/rbtree.h:169:112: error: invalid use of dependent type ‘typename rbtree<Key, Value>::Node’
include/rbtree.h:169:145: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                 ^
include/rbtree.h:169:165: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                     ^
include/rbtree.h:169:180: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                                    ^
include/rbtree.h:169:196: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Key key, const Value& value, Node *parent_ptr) noexcept : key_value{ key, value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                                                    ^
include/rbtree.h:170:1: error: expected unqualified-id before ‘{’ token
 {
 ^
include/rbtree.h:173:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:173:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:173:92: error: ‘Node’ is not a type
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                            ^~~~
include/rbtree.h:173:110: error: ISO C++ forbids declaration of ‘Node’ with no type [-fpermissive]
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                              ^~~~~~~~
include/rbtree.h:173:110: error: invalid use of dependent type ‘typename rbtree<Key, Value>::Node’
include/rbtree.h:173:142: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                              ^
include/rbtree.h:173:162: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                  ^
include/rbtree.h:173:177: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                                 ^
include/rbtree.h:173:193: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const KeyValue& key_value, Node *parent_ptr) noexcept : key_value{ key_value}, parent{parent_ptr}, left{nullptr}, right{nullptr}, black{true}
                                                                                                                                                                                                 ^
include/rbtree.h:174:1: error: expected unqualified-id before ‘{’ token
 {
 ^
include/rbtree.h:178:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:178:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:178:71: error: invalid use of template-name ‘Node’ without an argument list
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                       ^~~~
include/rbtree.h:178:71: note: class template argument deduction is only available with -std=c++1z or -std=gnu++1z
In file included from main.cpp:1:0:
include/rbtree.h:12:46: note: ‘template<class Key, class Value> class Node’ declared here
 template<typename Key, typename Value> class Node;
                                              ^~~~
In file included from main.cpp:1:0:
include/rbtree.h:178:83: error: ‘Node’ is not a type
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                   ^~~~
include/rbtree.h:178:101: error: ISO C++ forbids declaration of ‘Node’ with no type [-fpermissive]
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                     ^~~~~~~~
include/rbtree.h:178:101: error: invalid use of dependent type ‘typename rbtree<Key, Value>::Node’
include/rbtree.h:178:139: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                                                           ^
include/rbtree.h:178:164: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                                                                                    ^
include/rbtree.h:178:181: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                                                                                                     ^
include/rbtree.h:178:200: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                                                                                                                        ^
include/rbtree.h:178:219: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(const Node& node, Node *parent_ptr) noexcept : key_value{ node.key_value }, parent{node.parent_ptr}, left{node.left}, right{node.right}, black{node.black}, parent{parent_ptr}
                                                                                                                                                                                                                           ^
include/rbtree.h:179:1: error: expected unqualified-id before ‘{’ token
 {
 ^
include/rbtree.h:184:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:184:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:184:65: error: ‘Node’ is not a type
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                 ^~~~
include/rbtree.h:184:78: error: ISO C++ forbids declaration of ‘Node’ with no type [-fpermissive]
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                              ^~~~~~~~
include/rbtree.h:184:78: error: invalid use of dependent type ‘typename rbtree<Key, Value>::Node’
include/rbtree.h:184:127: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                                                                               ^
include/rbtree.h:184:152: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                                                                                                        ^
include/rbtree.h:184:180: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                                                                                                                                    ^
include/rbtree.h:184:210: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                                                                                                                                                                  ^
include/rbtree.h:184:229: error: expected unqualified-id before ‘,’ token
 template<class Key, class Value> rbtree<Key, Value>::Node::Node(Node&& node) noexcept : key_value{ std::move(node.key_value) }, parent{node.parent_ptr}, left{std::move(node.left)}, right{std::move(node.right)}, black{node.black}, parent{node.parent}
                                                                                                                                                                                                                                     ^
include/rbtree.h:185:1: error: expected unqualified-id before ‘{’ token
 {
 ^
include/rbtree.h:189:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::Node::connectChild(typename rbtree<Key, Value>::child_index child, std::unique_ptr<typename rbtree<Key, Value>::Node>& node_ptr) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:189:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::Node::connectChild(typename rbtree<Key, Value>::child_index child, std::unique_ptr<typename rbtree<Key, Value>::Node>& node_ptr) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:189:188: error: invalid use of dependent type ‘typename rbtree<Key, Value>::Node’
 template<class Key, class Value> void rbtree<Key, Value>::Node::connectChild(typename rbtree<Key, Value>::child_index child, std::unique_ptr<typename rbtree<Key, Value>::Node>& node_ptr) noexcept
                                                                                                                                                                                            ^~~~~~~~
include/rbtree.h:199:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:199:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:199:142: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                              ^
include/rbtree.h:199:142: note:   expected a type, got ‘Node’
include/rbtree.h:199:142: error: template argument 2 is invalid
include/rbtree.h:199:160: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPreOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                                                ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:220:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPostOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:220:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPostOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:220:143: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPostOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                               ^
include/rbtree.h:220:143: note:   expected a type, got ‘Node’
include/rbtree.h:220:143: error: template argument 2 is invalid
include/rbtree.h:220:161: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoPostOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                                                 ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:246:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> inline std::pair<bool, const typename rbtree<Key, Value>::Node *> rbtree<Key, Value>::find(Key key) const noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:246:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> inline std::pair<bool, const typename rbtree<Key, Value>::Node *> rbtree<Key, Value>::find(Key key) const noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:246:140: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> inline std::pair<bool, const typename rbtree<Key, Value>::Node *> rbtree<Key, Value>::find(Key key) const noexcept
                                                                                                                                            ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:254:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:254:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:254:141: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                             ^
include/rbtree.h:254:141: note:   expected a type, got ‘Node’
include/rbtree.h:254:141: error: template argument 2 is invalid
include/rbtree.h:254:159: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::DoInOrderTraverse(Functor f, const std::unique_ptr<Node>& current) const noexcept
                                                                                                                                                               ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:277:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::levelOrderTraverse(Functor f) const noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:277:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::levelOrderTraverse(Functor f) const noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:277:122: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> template<typename Functor> void rbtree<Key, Value>::levelOrderTraverse(Functor f) const noexcept
                                                                                                                          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:312:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> inline rbtree<Key, Value>::rbtree(const rbtree<Key, Value>& lhs) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:312:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> inline rbtree<Key, Value>::rbtree(const rbtree<Key, Value>& lhs) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:312:99: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> inline rbtree<Key, Value>::rbtree(const rbtree<Key, Value>& lhs) noexcept
                                                                                                   ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:321:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:321:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:321:96: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
                                                                                                ^
include/rbtree.h:321:96: note:   expected a type, got ‘Node’
include/rbtree.h:321:96: error: template argument 2 is invalid
include/rbtree.h:321:124: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
                                                                                                                            ^
include/rbtree.h:321:124: note:   expected a type, got ‘Node’
include/rbtree.h:321:124: error: template argument 2 is invalid
include/rbtree.h:321:182: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> void rbtree<Key, Value>::clone_tree(const std::unique_ptr<Node>& src, std::unique_ptr<Node>& dest, const typename rbtree<Key, Value>::Node *parent) noexcept
                                                                                                                                                                                      ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:334:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::destroy_tree(std::unique_ptr<Node> &current) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:334:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> void rbtree<Key, Value>::destroy_tree(std::unique_ptr<Node> &current) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:334:92: error: type/value mismatch at argument 1 in template parameter list for ‘template<class _Tp, class _Dp> class std::unique_ptr’
 template<class Key, class Value> void rbtree<Key, Value>::destroy_tree(std::unique_ptr<Node> &current) noexcept
                                                                                            ^
include/rbtree.h:334:92: note:   expected a type, got ‘Node’
include/rbtree.h:334:92: error: template argument 2 is invalid
include/rbtree.h:334:104: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> void rbtree<Key, Value>::destroy_tree(std::unique_ptr<Node> &current) noexcept
                                                                                                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:344:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(const rbtree<Key, Value>& lhs) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:344:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(const rbtree<Key, Value>& lhs) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:344:115: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(const rbtree<Key, Value>& lhs) noexcept
                                                                                                                   ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:356:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:356:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:356:110: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
                                                                                                              ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:368:10: error: declaration of template parameter ‘Key’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
          ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:10: note: template parameter ‘Key’ declared here
 template<typename Key, typename Value> class rbtree {
          ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:368:21: error: declaration of template parameter ‘Value’ shadows template parameter
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
                     ^~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:24: note: template parameter ‘Value’ declared here
 template<typename Key, typename Value> class rbtree {
                        ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:368:110: error: invalid use of incomplete type ‘class rbtree<Key, Value>’
 template<class Key, class Value> rbtree<Key, Value>& rbtree<Key, Value>::operator=(rbtree<Key, Value>&& lhs) noexcept
                                                                                                              ^~~~~~~~
In file included from main.cpp:1:0:
include/rbtree.h:15:46: note: declaration of ‘class rbtree<Key, Value>’
 template<typename Key, typename Value> class rbtree {
                                              ^~~~~~
main.cpp:4:7: error: expected nested-name-specifier before ‘namespace’
 using namespace std;
       ^~~~~~~~~
main.cpp:11:1: error: expected ‘}’ at end of input
 }
 ^
main.cpp:11:1: error: expected ‘;’ at end of input
nbproject/Makefile-Debug.mk:66: recipe for target 'build/Debug/GNU-Linux/main.o' failed
make[2]: *** [build/Debug/GNU-Linux/main.o] Error 1
make[2]: Leaving directory '/home/kurt/NetBeansProjects/redblack-cpp'
nbproject/Makefile-Debug.mk:59: recipe for target '.build-conf' failed
make[1]: *** [.build-conf] Error 2
make[1]: Leaving directory '/home/kurt/NetBeansProjects/redblack-cpp'
nbproject/Makefile-impl.mk:39: recipe for target '.build-impl' failed
make: *** [.build-impl] Error 2
